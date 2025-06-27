import { Pizza, PizzasTopping, ShowcasePizza, Topping } from "./directus-types"

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
