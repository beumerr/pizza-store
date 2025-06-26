import { PIZZA_CONFIG } from "../cfg/pizza-config"

import type { CartItem, PRODUCT_TYPE, TSize, TTopping } from "../util/types"

export const validatePizza = (size: TSize, toppings?: TTopping[]): string | false => {
  const sizeError = validateSize(size)
  if (sizeError) {
    return sizeError
  }

  const toppingsError = validateToppings(toppings)
  if (toppingsError) {
    return toppingsError
  }

  return false
}

export const validateSize = (size: TSize | null): string | false => {
  if (!size) {
    return "Select a size"
  }

  return false
}

export const validateToppings = (toppings?: TTopping[]): string | false => {
  if (!toppings || toppings.length < PIZZA_CONFIG.validation.minToppings) {
    return "You must select at least 2 toppings"
  }

  if (toppings.length > PIZZA_CONFIG.validation.maxToppings) {
    return `You can only select up to ${PIZZA_CONFIG.validation.maxToppings} toppings`
  }
  return false
}

export const validateCartItems = (items: CartItem[]): string | false => {
  if (items.length === 0) {
    return "Your cart is empty"
  }

  const validationMap: Record<PRODUCT_TYPE, (item: CartItem) => string | false> = {
    pizza: (item) => {
      const pizzaItem = item as CartItem & { productType: PRODUCT_TYPE.PIZZA }
      const sizeError = validateSize(pizzaItem.pizzaSize)
      if (sizeError) {
        return sizeError
      }
      const toppingsError = validateToppings(pizzaItem.pizzaToppings)
      if (toppingsError) {
        return toppingsError
      }
      return false
    },
    drink: () => {
      return false
    },
  }

  for (const item of items) {
    const validationError = validationMap[item.productType](item)
    if (validationError) {
      return validationError
    }
  }

  return false
}
