import { Pizza, Drink, Size, Topping } from "./directus-types"

export type PickOptional<T, K extends string> = Omit<T, Extract<K, keyof T>> &
  Partial<Pick<T, Extract<K, keyof T>>>

export type OptionalKeys =
  | "id"
  | "sort"
  | "user_created"
  | "date_created"
  | "user_updated"
  | "date_updated"

export enum PRODUCT_TYPE {
  PIZZA = "pizza",
  DRINK = "drink",
}

export type TPizza = PickOptional<Pizza, OptionalKeys | "image" | "toppings">
export type TDrink = PickOptional<Drink, OptionalKeys> & { id: number }
export type TSize = PickOptional<Size, OptionalKeys> & { id: number }
export type TTopping = PickOptional<Topping, OptionalKeys> & { id: number }

export interface BaseCartItem {
  uid: string
  quantity: number
  itemPrice: number
}

export interface DrinkCartItem {
  productType: PRODUCT_TYPE.DRINK
  drink: TDrink
}

export interface PizzaCartItem {
  productType: PRODUCT_TYPE.PIZZA
  pizza: TPizza
  pizzaSize: TSize
  pizzaToppings?: TTopping[]
}

export type CartItem = (DrinkCartItem | PizzaCartItem) & BaseCartItem

export type ItemPrice = Pick<BaseCartItem, "itemPrice">
