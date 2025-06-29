import { create } from "zustand"
import { devtools, persist } from "zustand/middleware"
import { calculatePizzaPriceBreakdown } from "shared/lib/calculations"

import { PRODUCT_TYPE } from "shared/util/types"
import { validateCartItems, validatePizza } from "shared/lib/validations"

import type { CartItem, DrinkCartItem, ItemPrice, PizzaCartItem } from "shared/util/types"
import type { Coupon } from "util/directus-types"
import { validate } from "webpack"
import { fetchDirectus } from "shared/util/util"

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
  applyCoupon: (coupon: string) => Promise<void>
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
        applyCoupon: async (couponCode: string) => {
          const state = get()
          const formatCode = couponCode.trim()

          if (!formatCode) {
            state.setError("Enter coupon code")
          }

          try {
            const validateCoupon = await fetchDirectus("/order/validate-coupon", {
              method: "POST",
              body: JSON.stringify({ couponCode: formatCode }),
            })

            if (validateCoupon?.error || !validateCoupon?.coupon) {
              state.setError(validateCoupon?.error || "Can not validate coupon")
              return
            }

            const coupon = validateCoupon.coupon as Coupon
            set({ coupon })

            state.recalculatePrice()
          } catch (error) {
            const err =
              error instanceof Error ? error.message : "Failed to validate coupon"
            console.error(err, error)
            state.setError(err)
          }
        },
        removeCoupon: () => {
          const state = get()
          if (!state.coupon) {
            state.setError("No coupon applied")
            return
          }

          set({ coupon: null })
          state.recalculatePrice()
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

          const discountPercentage = state.coupon?.discountPercentage || 0
          const discountAmount = (itemsTotal * discountPercentage) / 100
          const total = itemsTotal - discountAmount

          set({
            discountAmount,
            total,
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
            const createOrder = await fetchDirectus("/order/create", {
              method: "POST",
              body: JSON.stringify({
                cartItems: get().items,
                couponCode: get().coupon?.code || null,
              }),
            })

            if (createOrder?.error) {
              state.setError(createOrder.error || "Failed to create order")
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
          coupon: state.coupon,
        }),
        onRehydrateStorage: () => (state) => {
          state?.recalculatePrice()

          if (state?.coupon?.code) {
            state?.applyCoupon(state?.coupon?.code || "")
          }
        },
      }
    )
  )
)
