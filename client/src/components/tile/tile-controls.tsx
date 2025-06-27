"use client"

import React, { useMemo, useState } from "react"
import Button from "../button/button"

import { useCartStore } from "stores/cart"
import { DrinkCartItem, PizzaCartItem, PRODUCT_TYPE } from "shared/util/types"
import { cs, formatPrice } from "shared/util/util"
import { Size } from "shared/util/directus-types"
import { calculatePizzaPriceBreakdown } from "shared/lib/calculations"

import style from "./tile.module.scss"

export interface TileControlsProps {
  productType: PRODUCT_TYPE
  product: PizzaCartItem | DrinkCartItem
  sizes?: Size[]
}

export default function TileControls({ productType, product, sizes }: TileControlsProps) {
  const { addCartItem, setError } = useCartStore()
  const [selectedSize, setSelectedSize] = useState<Size | null>(sizes?.[0] ?? null)

  const price = useMemo(() => {
    const priceMap: Record<PRODUCT_TYPE, () => number> = {
      [PRODUCT_TYPE.PIZZA]: () => {
        if (!selectedSize) {
          return 0
        }

        const pizza = product as PizzaCartItem
        const price = calculatePizzaPriceBreakdown(selectedSize, pizza.pizzaToppings)

        return price.total
      },
      [PRODUCT_TYPE.DRINK]: () => {
        const drink = product as DrinkCartItem
        return drink.drink.price
      },
    }

    const productPrice = priceMap[productType]()

    return productPrice
  }, [selectedSize, product])

  const handleAddToCart = () => {
    if (productType === PRODUCT_TYPE.PIZZA && !selectedSize) {
      setError("Select a size")
      return
    }

    if (productType === PRODUCT_TYPE.PIZZA) {
      ;(product as PizzaCartItem).pizzaSize = selectedSize!
    }

    addCartItem(productType, {
      ...product,
    })
  }

  const onSizeChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    const sizeId = parseInt(e.target.value || "")
    const newSize = sizes?.find((s) => s.id === sizeId)
    setSelectedSize(newSize || null)
  }

  return (
    <div className={cs(style.Controls)}>
      {!!sizes?.length && (
        <div className={style.row}>
          <div className={style.select}>
            <select value={selectedSize?.id || ""} onChange={onSizeChange}>
              <option value="">Select size</option>
              {sizes.map(({ id, sizeLabel, sizeDiameter }) => (
                <option key={`size_${id}`} value={id}>
                  {sizeLabel} ({sizeDiameter}CM)
                </option>
              ))}
            </select>
          </div>
        </div>
      )}
      <div className={style.row}>
        <div className={style.price}>{formatPrice(price)}</div>
        <Button size="small" color="green" onClick={handleAddToCart}>
          Add
        </Button>
      </div>
    </div>
  )
}
