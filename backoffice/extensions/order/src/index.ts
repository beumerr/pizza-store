import dotenv from "dotenv"
import { defineEndpoint } from "@directus/extensions-sdk"
import { validateCartItems } from "./shared/lib/validations"
import { PRODUCT_TYPE } from "./shared/util/types"
import { calculatePizzaPriceBreakdown } from "./shared/lib/calculations"

import type {
  CartItem,
  PizzaCartItem,
  DeepPartial,
  DrinkCartItem,
  BaseCartItem,
} from "./shared/util/types"
import type { CartItem as DirectusCartItem, Order } from "./shared/util/directus-types"

dotenv.config()

type PartialCartItem = DeepPartial<DirectusCartItem>
type PartialOrder = DeepPartial<Order>

const DEFAULT_TAX_RATE = parseInt(process.env.DEFAULT_TAX_RATE || "21")

export default defineEndpoint((router, { services, getSchema }) => {
  router.post("/validate-coupon", async (req, res) => {
    try {
      const { couponCode } = req.body as { couponCode: string }

      // Initialize services
      const { ItemsService } = services
      const schema = await getSchema()
      const accountability = null
      const couponService = new ItemsService("coupons", { schema, accountability })

      // Validate coupon
      const coupon = await getValidCoupon(couponService, couponCode)
      if (coupon?.error || !coupon?.item) {
        return res
          .status(coupon?.code ?? 400)
          .json({ error: coupon?.error || "Invalid coupon code" })
      }

      return res.status(200).json({
        success: true,
        coupon: coupon.item,
        message: "Coupon is valid",
      })
    } catch (error) {
      console.error("Error validating coupon", error)
      return res.status(500).json({
        error: "Internal server error while validating coupon",
      })
    }
  })
  router.post("/create", async (req, res) => {
    try {
      const { cartItems, couponCode } = req.body as {
        cartItems: CartItem[]
        couponCode?: string
      }

      // Initialize services
      const { ItemsService } = services
      const schema = await getSchema()
      const accountability = null

      const cartItemService = new ItemsService("cartItem", { schema, accountability })
      const pizzaService = new ItemsService("pizzas", { schema, accountability })
      const orderService = new ItemsService("orders", { schema, accountability })
      const settingsService = new ItemsService("settings", { schema, accountability })
      const couponService = new ItemsService("coupons", { schema, accountability })

      // Validate coupon
      const coupon = await getValidCoupon(couponService, couponCode)
      if (coupon?.error || !coupon?.item) {
        return res
          .status(coupon?.code ?? 400)
          .json({ error: coupon?.error || "Invalid coupon code" })
      }
      // Validate cart items
      const validationError = validateCartItems(cartItems)
      if (validationError) {
        return res.status(400).json({ error: validationError })
      }

      // Format cart items
      const processedCartItems = await Promise.all(
        cartItems.map((item) => processCartItems[item.productType](item, pizzaService))
      )

      // Insert cart items
      const createdCartItems = (await cartItemService.createMany(
        processedCartItems as PartialCartItem[]
      )) as DirectusCartItem[]

      if (!createdCartItems || createdCartItems.length === 0) {
        return res.status(500).json({ error: "Failed to create cart items" })
      }

      // Calculate prices
      const totalIncludingTax = processedCartItems.reduce(
        (total, item) => total + (item.totalPrice || 0),
        0
      )

      const discountPercentage = coupon?.item?.discountPercentage || 0
      const taxPercentage = await getTaxRate(settingsService)
      const subTotal = totalIncludingTax / (1 + taxPercentage / 100)
      const discountValue = (subTotal * discountPercentage) / 100
      const totalExc = subTotal - discountValue
      const taxTotal = (totalExc * taxPercentage) / 100
      const totalInc = totalExc + taxTotal

      // Create and insert order
      const orderData: PartialOrder = {
        cartItems: createdCartItems.map((cartItem_id) => ({ cartItem_id })),
        orderStatus: "new",
        totalInc,
        totalExc,
        subTotal,
        taxTotal,
        taxPercentage,
        discountPercentage,
        discountValue,
      }

      const createdOrder = await orderService.createOne(orderData)

      if (!createdOrder) {
        return res.status(500).json({ error: "Failed to create order" })
      }

      // Update coupon consume count
      if (coupon?.item) {
        await couponService.updateOne(coupon.item.id, {
          consumeCount: coupon.item.consumeCount + 1,
        })
      }

      return res.status(200).json({
        success: true,
        orderId: createdOrder.id,
      })
    } catch (error) {
      console.error("Error creating order", error)
      return res.status(500).json({
        error: "Internal server error while creating order",
      })
    }
  })
})

// Find or create product types and format CartItem props
const processCartItems: Record<
  PRODUCT_TYPE,
  (item: CartItem, pizzaService: any) => Promise<PartialCartItem>
> = {
  [PRODUCT_TYPE.PIZZA]: async (item, pizzaService) => {
    try {
      // Base props
      const pizzaItem = item as PizzaCartItem & BaseCartItem
      const props: PartialCartItem = {
        productType: PRODUCT_TYPE.PIZZA,
        pizzaSize: pizzaItem.pizzaSize.id,
        uid: pizzaItem.uid,
        quantity: pizzaItem.quantity,
        pizzaToppings:
          pizzaItem.pizzaToppings?.map((topping) => ({
            toppings_id: topping.id,
          })) || [],
        totalPrice: calculatePizzaPriceBreakdown(
          pizzaItem.pizzaSize,
          pizzaItem.pizzaToppings
        ).total,
      }

      // Check if pizza already exists
      if (pizzaItem.pizza.id) {
        try {
          const existingPizza = await pizzaService.readOne(pizzaItem.pizza.id)
          if (!existingPizza) {
            throw new Error(`Pizza with ID ${pizzaItem.pizza.id} not found`)
          }
          props.pizza = existingPizza.id
        } catch (error) {
          throw new Error(`Pizza with ID ${pizzaItem.pizza.id} not found`)
        }
      } else {
        // Else create a new pizza
        const pizza = await pizzaService.createOne({
          pizzaType: "generated",
          name: pizzaItem.pizza.name,
          toppings:
            pizzaItem.pizzaToppings?.map((topping) => ({
              toppings_id: topping.id,
            })) || [],
        })

        if (!pizza) {
          throw new Error("Failed to create pizza")
        }
        props.pizza = pizza
      }

      return props
    } catch (error) {
      console.error("Error processing pizza item", error)
      throw new Error("Failed to process pizza item")
    }
  },

  [PRODUCT_TYPE.DRINK]: async (item) => {
    const drinkItem = item as DrinkCartItem & BaseCartItem
    const props: PartialCartItem = {
      productType: PRODUCT_TYPE.DRINK,
      uid: drinkItem.uid,
      quantity: drinkItem.quantity,
      drink: drinkItem.drink.id,
      totalPrice: drinkItem.drink.price * drinkItem.quantity,
    }
    return props
  },
}

async function getTaxRate(settingsService: any): Promise<number> {
  try {
    const settings = await settingsService.readOne(1)
    return settings?.taxRateHigh ? parseInt(settings.taxRateHigh) : DEFAULT_TAX_RATE
  } catch (error) {
    console.error("Error fetching tax rate from settings", error)
    return DEFAULT_TAX_RATE
  }
}

async function getValidCoupon(
  couponService: any,
  couponCode?: string
): Promise<{ item?: any; error?: string; code?: number } | null> {
  try {
    if (couponCode === null || couponCode === undefined) {
      return null
    }

    if (!couponCode || typeof couponCode !== "string") {
      return { error: "Invalid coupon code", code: 400 }
    }

    const couponItem = await couponService.readByQuery({
      limit: 1,
      fields: ["*"],
      filter: { code: { _eq: couponCode } },
    })

    if (!couponItem?.length) {
      return { error: "Coupon not found", code: 404 }
    }

    if (
      couponItem[0].amountOfUses !== -1 &&
      couponItem[0].consumeCount >= couponItem[0].amountOfUses
    ) {
      return { error: "Coupon already consumed", code: 409 }
    }

    return { item: couponItem[0] }
  } catch (error) {
    console.error("Error fetching coupon", error)
    throw new Error("Failed to fetch coupon")
  }
}

//
// SDK example (typed)
//

// import dotenv from "dotenv"
// import directus from "./lib/directus"

// import { defineEndpoint } from "@directus/extensions-sdk"
// import { validateCartItems } from "./shared/lib/validations"
// import { PRODUCT_TYPE } from "./shared/util/types"
// import { calculatePizzaPriceBreakdown } from "./shared/lib/calculations"

// import type {
//   CartItem,
//   PizzaCartItem,
//   DeepPartial,
//   DrinkCartItem,
//   BaseCartItem,
// } from "./shared/util/types"
// import type { CartItem as DirectusCartItem, Order } from "./shared/util/directus-types"

// dotenv.config()

// type PartialCartItem = DeepPartial<DirectusCartItem>
// type PartialOrder = DeepPartial<Order>

// const DEFAULT_TAX_RATE = parseInt(process.env.DEFAULT_TAX_RATE || "21")

// export default defineEndpoint((router) => {
//   router.post("/create", async (req, res) => {
//     try {
//       const { cartItems } = req.body as { cartItems: CartItem[] }

//       // Validate cart items
//       const validationError = validateCartItems(cartItems)
//       if (validationError) {
//         return res.status(400).json({ error: validationError })
//       }

//       // Format cart items
//       const processedCartItems = await Promise.all(
//         cartItems.map((item) => processCartItems[item.productType](item))
//       )

//       // Insert cart items
//       const createdCartItems = await directus.createItems(
//         "cartItem",
//         processedCartItems as any // todo fix any https://trello.com/c/EdqjUVzp
//       )

//       if (!createdCartItems || createdCartItems.length === 0) {
//         return res.status(500).json({ error: "Failed to create cart items" })
//       }

//       // Calculate prices
//       const totalIncludingTax = createdCartItems.reduce(
//         (total, item) => total + (item.totalPrice || 0),
//         0
//       )
//       const taxPercentage = await getTaxRate()
//       const totalExcludingTax = totalIncludingTax / (1 + taxPercentage / 100)

//       // Create and insert order
//       // todo fix any https://trello.com/c/EdqjUVzp
//       const orderData: PartialOrder = {
//         orderStatus: "new",
//         discountPercentage: 0,
//         discountValue: 0,
//         cartItems: createdCartItems.map((item) => ({ cartItem_id: item.id })),
//         totalInc: totalIncludingTax,
//         totalExc: totalExcludingTax,
//         taxPercentage,
//       }
//       const createdOrder = await directus.createItem("orders", orderData as any)

//       if (!createdOrder) {
//         return res.status(500).json({ error: "Failed to create order" })
//       }

//       // Order created successfully
//       return res.status(200).json({
//         success: true,
//         orderId: createdOrder.id,
//       })
//     } catch (error) {
//       console.error("Error creating order", error)
//       return res.status(500).json({
//         error: "Internal server error while creating order",
//       })
//     }
//   })
// })

// // Find or create product types and format CartItem props
// const processCartItems: Record<
//   PRODUCT_TYPE,
//   (item: CartItem) => Promise<PartialCartItem | { error: string }>
// > = {
//   [PRODUCT_TYPE.PIZZA]: async (item) => {
//     try {
//       // Base props
//       const pizzaItem = item as PizzaCartItem & BaseCartItem
//       const props: PartialCartItem = {
//         productType: PRODUCT_TYPE.PIZZA,
//         pizzaSize: pizzaItem.pizzaSize.id,
//         uid: pizzaItem.uid,
//         quantity: pizzaItem.quantity,
//         pizzaToppings:
//           pizzaItem.pizzaToppings?.map((topping) => ({
//             toppings_id: topping.id,
//           })) || [],
//         totalPrice: calculatePizzaPriceBreakdown(
//           pizzaItem.pizzaSize,
//           pizzaItem.pizzaToppings
//         ).total,
//       }

//       // Check if pizza already exists
//       if (pizzaItem.pizza.id) {
//         const existingPizza = await directus.readItem("pizzas", pizzaItem.pizza.id)
//         if (!existingPizza?.[0]) {
//           throw new Error(`Pizza with ID ${pizzaItem.pizza.id} not found`)
//         }
//         props.pizza = existingPizza[0].id

//         // Else create a new pizza
//       } else {
//         const pizza = await directus.createItem("pizzas", {
//           pizzaType: "generated",
//           name: pizzaItem.pizza.name,
//           toppings:
//             pizzaItem.pizzaToppings?.map((topping) => ({
//               toppings_id: topping.id,
//             })) || [],
//         } as any) // todo fix any https://trello.com/c/EdqjUVzp

//         if (!pizza) {
//           throw new Error("Failed to create pizza")
//         }
//         props.pizza = pizza.id
//       }

//       return props
//     } catch (error) {
//       console.error("Error processing pizza item", error)
//       return { error: "Failed to process pizza item" }
//     }
//   },

//   [PRODUCT_TYPE.DRINK]: async (item) => {
//     const drinkItem = item as DrinkCartItem & BaseCartItem
//     const props: PartialCartItem = {
//       productType: PRODUCT_TYPE.DRINK,
//       uid: drinkItem.uid,
//       quantity: drinkItem.quantity,
//       drink: drinkItem.drink.id,
//       totalPrice: drinkItem.drink.price * drinkItem.quantity,
//     }
//     return props
//   },
// }

// async function getTaxRate(): Promise<number> {
//   try {
//     const settings = await directus.readSingleton("settings")
//     return settings?.taxRateHigh || DEFAULT_TAX_RATE
//   } catch (error) {
//     console.error("Error fetching tax rate from settings", error)
//     return DEFAULT_TAX_RATE
//   }
// }
