import { PRODUCT_TYPE } from "./types"

import type { Pizza, PizzasTopping, ShowcasePizza, Topping } from "./directus-types"
import type { PizzaCartItem, DrinkCartItem } from "./types"

export function cs(...args: any[]): string {
  return args.filter((arg) => typeof arg === "string" && arg !== "").join(" ")
}

export function formatPrice(price: number): string {
  return new Intl.NumberFormat("nl-NL", {
    style: "currency",
    currency: "EUR",
    minimumFractionDigits: 2,
    maximumFractionDigits: 2,
  }).format(price)
}

export function isPopulatedPizza(pizza: number | Pizza): pizza is Pizza {
  return typeof pizza === "object" && pizza !== null && "name" in pizza
}

export function isPopulatedShowcasePizza(
  pizza: number | ShowcasePizza
): pizza is ShowcasePizza {
  return typeof pizza === "object" && pizza !== null && "pizzas_id" in pizza
}

export function isPopulatedTopping(topping: number | Topping): topping is Topping {
  return typeof topping === "object" && topping !== null && "name" in topping
}

export function isPopulatedPizzasTopping(
  topping: number | PizzasTopping
): topping is PizzasTopping {
  return typeof topping === "object" && topping !== null && "toppings_id" in topping
}

export function extractPopulatedData<T extends Record<string, any>>(
  item: number | T,
  itemName: string
): T {
  if (typeof item === "number") {
    throw new Error(`Expected populated ${itemName}, but received ID: ${item}`)
  }
  return item
}

export const fetchDirectus = async (url: string, options?: RequestInit) => {
  const response = await fetch(`${process.env.NEXT_PUBLIC_DIRECTUS_URL}${url}`, {
    ...options,
    headers: {
      ...options?.headers,
      "Content-Type": "application/json",
    },
  })

  if (!response.ok) {
    let msg = `Directus request failed with status ${response.status}`
    try {
      const errorData = await response.json()
      if (errorData.error) {
        msg = errorData.error
      }
    } catch {
      // Keep original message
    }
    throw new Error(msg)
  }

  const json = await response.json()
  return json
}

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
