import React, { useEffect, useRef } from "react"
import { cs, formatPrice } from "shared/util/util"
import { useCartStore } from "stores/cart"
import { PRODUCT_TYPE, TDrink } from "shared/util/types"
import { useDrinks } from "@/hooks/use-action"

import style from "./cart-summary.module.scss"

export default function CartDrinkSelect() {
  const { execute, loading, data } = useDrinks()
  const { addCartItem, setError } = useCartStore()
  const selectRef = useRef<HTMLSelectElement>(null)

  useEffect(() => {
    const fetchDrinks = async () => {
      try {
        await execute()
      } catch (error) {
        console.error("Failed to fetch drinks:", error)
      }
    }

    fetchDrinks()
  }, [])

  const handleDrinkChange = (event: React.ChangeEvent<HTMLSelectElement>) => {
    selectRef.current?.blur()

    const drinkId = parseInt(event.target.value)
    if (!drinkId) return

    const drink: TDrink | undefined = data?.find((d) => d.id === drinkId)
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
      {loading || data === null ? (
        <span className={style.select}>Loading drinks...</span>
      ) : (
        <select
          className={style.select}
          ref={selectRef}
          value="0"
          onChange={handleDrinkChange}>
          <option value="0">Select drink</option>
          {data?.map((drink) => (
            <option key={drink.id} value={drink.id}>
              {drink.name} - {formatPrice(drink.price)}
            </option>
          ))}
        </select>
      )}
    </div>
  )
}
