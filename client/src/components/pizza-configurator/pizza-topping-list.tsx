import { calculateSingleToppingPrice } from "shared/lib/calculations"
import { useMemo } from "react"
import { STORE_CONFIG } from "shared/cfg/store-config"
import { formatPrice } from "shared/util/util"

import type { TTopping, TSize } from "shared/util/types"

import style from "./pizza-configurator.module.scss"

interface ToppingsListProps {
  toppings: TTopping[]
  selectedToppings: TTopping[]
  selectedSize: TSize | null
  onToppingToggle: (topping: TTopping) => void
}

export default function ToppingsList({
  toppings,
  selectedToppings,
  selectedSize,
  onToppingToggle,
}: ToppingsListProps) {
  const getToppingPrice = (topping: TTopping) => {
    if (!selectedSize) return topping.priceBase
    return calculateSingleToppingPrice(selectedSize, topping)
  }

  const freeToppingIds = useMemo(() => {
    if (!selectedSize || selectedToppings.length <= STORE_CONFIG.toppings.maxFree) {
      return selectedToppings.map((t) => t.id)
    }

    const sortedByPrice = selectedToppings
      .map((topping) => ({
        id: topping.id,
        price: calculateSingleToppingPrice(selectedSize, topping),
      }))
      .sort((a, b) => a.price - b.price)
      .slice(0, STORE_CONFIG.toppings.maxFree)

    return sortedByPrice.map((t) => t.id)
  }, [selectedToppings, selectedSize])

  return (
    <div className={style.ToppingsList}>
      {toppings.map((topping) => {
        const isSelected = selectedToppings.some((t) => t.id === topping.id)
        const isFree = isSelected && freeToppingIds.includes(topping.id)
        const price = getToppingPrice(topping)

        return (
          <label key={topping.id} className={style.item}>
            <input
              type="checkbox"
              checked={isSelected}
              onChange={() => onToppingToggle(topping)}
              className={style.checkbox}
            />
            <span className={style.indicator}></span>
            <span className={style.name}>{topping.name}</span>
            <span className={style.price}>
              {isFree ? <span className={style.free}>Free</span> : formatPrice(price)}
            </span>
          </label>
        )
      })}
    </div>
  )
}
