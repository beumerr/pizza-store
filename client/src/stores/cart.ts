import { create } from "zustand"
import { devtools, persist } from "zustand/middleware"
import { calculatePizzaPrice } from "shared/lib/calculations"

import type { PickOptional, OptionalKeys } from "shared/util/types"
import type { Pizza, Topping, Size, Drink, Coupon } from "util/directus-types"

export enum PRODUCT_TYPE {
  PIZZA = "pizza",
  DRINK = "drink",
}

interface BaseCartItem {
  uid: string
  quantity: number
  itemPrice: number
}

interface DrinkCartItem {
  productType: PRODUCT_TYPE.DRINK
  drink: PickOptional<Drink, OptionalKeys>
}

interface PizzaCartItem {
  productType: PRODUCT_TYPE.PIZZA
  pizza: PickOptional<Pizza, OptionalKeys>
  pizzaSize: PickOptional<Size, OptionalKeys> & { id: number }
  pizzaToppings?: (PickOptional<Topping, OptionalKeys> & { id: number })[]
}

type CartItem = (DrinkCartItem | PizzaCartItem) & BaseCartItem

type ItemPrice = Pick<BaseCartItem, "itemPrice">

interface CartState {
  items: CartItem[]
  coupon: Coupon | null
  discountAmount: number
  total: number
  error: string | null
  errorDuration: number
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
}

type CartStore = CartState & CartActions

const initialState: CartState = {
  items: [],
  coupon: null,
  discountAmount: 0,
  total: 0,
  error: null,
  errorDuration: 5000,
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
          set({
            error,
          })

          setTimeout(() => {
            set({
              error: null,
            })
          }, get().errorDuration)
        },
        addCartItem: (productType: PRODUCT_TYPE, item: PizzaCartItem | DrinkCartItem) => {
          const state = get()
          if (!item) {
            state.setError("Item is missing")
            return
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
                itemPrice: calculatePizzaPrice(
                  pizzaItem.pizzaSize,
                  pizzaItem.pizzaToppings
                ),
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
            error: null,
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
          const { items } = get()
          if (items.length === 0) {
            get().setError("Cart is empty")
            return
          }
          // todo #US_8
        },
      }),
      {
        name: "pizza-cart-storage",
        partialize: (state) => ({
          items: state.items,
        }),
      }
    ),
    { name: "pizza-cart" }
  )
)
