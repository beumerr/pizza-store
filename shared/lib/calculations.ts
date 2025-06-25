import type { Size, Topping } from "../util/directus-types"
import type { PickOptional, OptionalKeys } from "../util/types"

export const calculatePizzaPrice = (
  size: PickOptional<Size, OptionalKeys>,
  toppings?: PickOptional<Topping, OptionalKeys>[]
): number => {
  const sizeArea = Math.PI * Math.pow(parseInt(size.sizeDiameter) / 2, 2)
  const basePrice = size.priceCm2 * sizeArea
  const toppingsPrice =
    (toppings?.length ?? 0 > 0)
      ? (toppings?.reduce((total, topping) => {
          return total + topping.priceBase + topping.priceCm2 * sizeArea
        }, 0) ?? 0)
      : 0

  return Math.round((basePrice + toppingsPrice) * 100) / 100
}
