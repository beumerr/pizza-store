import { calculatePizzaToppingsPrice } from "shared/lib/calculations"

import type { TTopping, TSize } from "stores/cart"

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
    return calculatePizzaToppingsPrice(selectedSize, [topping])
  }

  return (
    <div className={style.ToppingsList}>
      {toppings.map((topping) => {
        const isSelected = selectedToppings.some((t) => t.id === topping.id)
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
            <span className={style.price}>€ {price.toFixed(2)}</span>
          </label>
        )
      })}
    </div>
  )
}
