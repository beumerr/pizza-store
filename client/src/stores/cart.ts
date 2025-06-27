import { create } from "zustand"
import { devtools, persist } from "zustand/middleware"
import { calculatePizzaPriceBreakdown } from "shared/lib/calculations"

import { PRODUCT_TYPE } from "shared/util/types"
import { validateCartItems, validatePizza } from "shared/lib/validations"

import type { CartItem, DrinkCartItem, ItemPrice, PizzaCartItem } from "shared/util/types"
import type { Coupon } from "util/directus-types"
import { validate } from "webpack"

export interface CartState {
  items: CartItem[]
  coupon: Coupon | null
  discountAmount: number
  total: number
}

interface CartActions {
  getCartItem: (itemId: string) => CartItem | undefined
  getCartItems: () => CartItem[] | []
  addCartItem: (productType: PRODUCT_TYPE, item: PizzaCartItem | DrinkCartItem) => void
  removeItem: (itemId: string) => void
  applyCoupon: (coupon: Coupon) => void
  removeCoupon: () => void
  clearCart: () => void
  recalculatePrice: () => void
  submitOrder: () => Promise<void>
  setError: (error: string) => void
  isInvalidOrder: () => false | string
}

type CartStore = CartState & CartActions

const initialState: CartState = {
  items: [],
  coupon: null,
  discountAmount: 0,
  total: 0,
}

export const useCartStore = create<CartStore>()(
  devtools(
    persist(
      (set, get) => ({
        ...initialState,
        getCartItem: (itemId: string) => {
          return get().items.find((item) => item.uid === itemId)
        },
        getCartItems: () => {
          return get().items
        },
        setError: (error: string) => {
          alert(error)
          // todo improve visual feedback
        },
        addCartItem: (productType: PRODUCT_TYPE, item: PizzaCartItem | DrinkCartItem) => {
          const state = get()

          if (productType === PRODUCT_TYPE.PIZZA) {
            const pizza = item as PizzaCartItem
            const error = validatePizza(pizza.pizzaSize, pizza.pizzaToppings)

            if (error) {
              alert(error)
              return
            }
          }

          const productMap: Record<
            PRODUCT_TYPE,
            (
              item: PizzaCartItem | DrinkCartItem
            ) => (PizzaCartItem | DrinkCartItem) & ItemPrice
          > = {
            [PRODUCT_TYPE.PIZZA]: (item) => {
              const pizzaItem = item as PizzaCartItem
              const data: PizzaCartItem & ItemPrice = {
                ...pizzaItem,
                productType: PRODUCT_TYPE.PIZZA,
                itemPrice: calculatePizzaPriceBreakdown(
                  pizzaItem.pizzaSize,
                  pizzaItem.pizzaToppings
                ).total,
              }

              return data
            },
            [PRODUCT_TYPE.DRINK]: (item) => {
              const drinkItem = item as DrinkCartItem
              const data: DrinkCartItem & ItemPrice = {
                ...drinkItem,
                productType: PRODUCT_TYPE.DRINK,
                itemPrice: drinkItem.drink.price,
              }

              return data
            },
          }

          const cartItem = productMap[productType](item)
          const uid = crypto.randomUUID()
          const quantity = 1
          const newItem: CartItem = {
            ...cartItem,
            uid,
            quantity,
          }

          set((state) => ({
            items: [...state.items, newItem],
          }))

          state.recalculatePrice()
        },
        removeItem: (itemId: string) => {
          const state = get()
          const item = state.getCartItem(itemId)
          if (!item) {
            state.setError("Item not found in cart")
            return
          }

          set((state) => ({
            items: state.items.filter((item) => item.uid !== itemId),
          }))

          state.recalculatePrice()
        },
        applyCoupon: (coupon: Coupon) => {
          // todo #US_10
        },
        removeCoupon: () => {
          // todo #US_10
        },
        clearCart: () => {
          set({
            items: [],
            coupon: null,
            discountAmount: 0,
            total: 0,
          })
        },
        recalculatePrice: () => {
          const state = get()
          const itemsTotal = state.items.reduce((total, item) => {
            return total + item.itemPrice * item.quantity
          }, 0)

          const discountAmount = 0 // todo #US_10
          const total = itemsTotal - discountAmount

          set({
            discountAmount: Math.round(discountAmount * 100) / 100,
            total: Math.round(total * 100) / 100,
          })
        },
        submitOrder: async () => {
          const state = get()
          const error = state.isInvalidOrder()
          if (error) {
            state.setError(error)
            return
          }

          try {
            const createOrder = await fetch(
              `${process.env.NEXT_PUBLIC_DIRECTUS_URL}/order/create`,
              {
                method: "POST",
                headers: {
                  "Content-Type": "application/json",
                },
                body: JSON.stringify({
                  cartItems: get().items,
                }),
              }
            )

            const json = await createOrder.json()

            if (json?.error || !createOrder.ok) {
              state.setError(json?.error || "Failed to create order")
              return
            }

            alert("Order submitted successfully!")
            get().clearCart()
          } catch (error) {
            console.error("Error while submitting order", error)
            state.setError("Failed to submit order")
          }
        },
        isInvalidOrder: () => {
          const items = get().items
          const error = validateCartItems(items)

          return error
        },
      }),
      {
        name: "pizza-cart-storage",
        partialize: (state) => ({
          items: state.items,
        }),
        onRehydrateStorage: () => (state) => {
          state?.recalculatePrice()
        },
      }
    ),
    { name: "pizza-cart" }
  )
)

export const getTitle = (item: PizzaCartItem | DrinkCartItem) => {
  const titleMap: Record<PRODUCT_TYPE, () => { name: string; sub?: string }> = {
    [PRODUCT_TYPE.PIZZA]: () => {
      const { pizza, pizzaSize, pizzaToppings } = item as PizzaCartItem
      const name = pizza.name || "Your pizza"
      const size = pizzaSize.sizeDiameter

      return {
        name: `${name} (${size}CM)`,
        sub: pizzaToppings?.map((t) => t.name).join(", ") || "No toppings",
      }
    },
    [PRODUCT_TYPE.DRINK]: () => {
      const { drink } = item as DrinkCartItem
      return { name: drink.name }
    },
  }

  return titleMap[item.productType]()
}
