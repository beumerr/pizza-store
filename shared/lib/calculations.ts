import type { Size, Topping } from "../util/directus-types"
import type { PickOptional, OptionalKeys } from "../util/types"

export interface PizzaPriceBreakdown {
  basePrice: number
  toppingsPrice: number
  total: number
}

export const calculatePizzaBasePrice = (
  size: PickOptional<Size, OptionalKeys>
): number => {
  const sizeArea = Math.PI * Math.pow(parseInt(size.sizeDiameter) / 2, 2)
  const basePrice = size.priceCm2 * sizeArea
  return Math.round(basePrice * 100) / 100
}

export const calculatePizzaToppingsPrice = (
  size: PickOptional<Size, OptionalKeys>,
  toppings?: PickOptional<Topping, OptionalKeys>[]
): number => {
  if (!toppings || toppings.length === 0) return 0

  const sizeArea = Math.PI * Math.pow(parseInt(size.sizeDiameter) / 2, 2)
  const toppingsPrice = toppings.reduce((total, topping) => {
    return total + topping.priceBase + topping.priceCm2 * sizeArea
  }, 0)

  return Math.round(toppingsPrice * 100) / 100
}

export const calculatePizzaPriceBreakdown = (
  size: PickOptional<Size, OptionalKeys>,
  toppings?: PickOptional<Topping, OptionalKeys>[]
): PizzaPriceBreakdown => {
  const basePrice = calculatePizzaBasePrice(size)
  const toppingsPrice = calculatePizzaToppingsPrice(size, toppings)
  const total = Math.round((basePrice + toppingsPrice) * 100) / 100

  return { basePrice, toppingsPrice, total }
}
