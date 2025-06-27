import { STORE_CONFIG } from "../cfg/store-config"
import { PRODUCT_TYPE } from "../util/types"
import type { CartItem, TSize, TTopping } from "../util/types"

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
  if (!toppings || toppings.length < STORE_CONFIG.validation.minToppings) {
    return "You must select at least 2 toppings"
  }

  if (toppings.length > STORE_CONFIG.validation.maxToppings) {
    return `You can only select up to ${STORE_CONFIG.validation.maxToppings} toppings`
  }
  return false
}

export const validateCartItems = (items?: CartItem[]): string | false => {
  if (!items || items.length === 0) {
    return "Your cart is empty"
  }

  if (items.length > STORE_CONFIG.validation.maxItems) {
    return `You can only have up to ${STORE_CONFIG.validation.maxItems} items in your cart`
  }

  const validationMap: Record<PRODUCT_TYPE, (item: CartItem) => string | false> = {
    [PRODUCT_TYPE.PIZZA]: (item) => {
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
    [PRODUCT_TYPE.DRINK]: () => {
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
