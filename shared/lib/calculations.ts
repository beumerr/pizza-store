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

export const calculatePizzaPriceBreakdown = (
  size: PickOptional<Size, OptionalKeys>,
  toppings?: PickOptional<Topping, OptionalKeys>[]
): PizzaPriceBreakdown => {
  const basePrice = calculatePizzaBasePrice(size)
  const toppingsPrice = calculatePizzaToppingsPrice(size, toppings)
  const total = Math.round((basePrice + toppingsPrice) * 100) / 100

  return { basePrice, toppingsPrice, total }
}

export const calculateSingleToppingPrice = (
  size: PickOptional<Size, OptionalKeys>,
  topping: PickOptional<Topping, OptionalKeys>
): number => {
  const sizeArea = Math.PI * Math.pow(parseInt(size.sizeDiameter) / 2, 2)
  const price = topping.priceBase + topping.priceCm2 * sizeArea
  return Math.round(price * 100) / 100
}

export const calculatePizzaToppingsPrice = (
  size: PickOptional<Size, OptionalKeys>,
  toppings?: PickOptional<Topping, OptionalKeys>[]
): number => {
  if (!toppings || toppings.length === 0) return 0

  const sizeArea = Math.PI * Math.pow(parseInt(size.sizeDiameter) / 2, 2)
  const toppingPrices = toppings
    .map((topping) => ({
      topping,
      price: topping.priceBase + topping.priceCm2 * sizeArea,
    }))
    .sort((a, b) => a.price - b.price)

  const chargeableToppings = toppingPrices.slice(3)
  const toppingsPrice = chargeableToppings.reduce((total, item) => {
    return total + item.price
  }, 0)

  return Math.round(toppingsPrice * 100) / 100
}
