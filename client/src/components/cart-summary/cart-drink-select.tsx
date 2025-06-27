import React, { useRef } from "react"
import { cs, formatPrice } from "shared/util/util"
import { useCartStore } from "stores/cart"
import { PRODUCT_TYPE, TDrink } from "shared/util/types"

import style from "./cart-summary.module.scss"
export interface CartDrinkSelectProps {
  drinks: TDrink[]
}

export default function CartDrinkSelect({ drinks }: CartDrinkSelectProps) {
  const { addCartItem, setError } = useCartStore()
  const selectRef = useRef<HTMLSelectElement>(null)

  const handleDrinkChange = (event: React.ChangeEvent<HTMLSelectElement>) => {
    selectRef.current?.blur()

    const drinkId = parseInt(event.target.value)
    if (!drinkId) return

    const drink: TDrink | undefined = drinks?.find((d) => d.id === drinkId)
    if (!drink) {
      setError("Drink not found")
      return
    }

    addCartItem(PRODUCT_TYPE.DRINK, {
      productType: PRODUCT_TYPE.DRINK,
      drink,
    })
  }

  return (
    <div className={cs(style.CartDrinkSelect)}>
      {!!drinks.length && (
        <select
          className={style.select}
          ref={selectRef}
          value="0"
          onChange={handleDrinkChange}>
          <option value="0">Select drink</option>
          {drinks.map((drink) => (
            <option key={drink.id} value={drink.id}>
              {drink.name} - {formatPrice(drink.price)}
            </option>
          ))}
        </select>
      )}
    </div>
  )
}
