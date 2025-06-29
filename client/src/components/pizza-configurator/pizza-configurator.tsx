"use client"

import SizeSelector from "./pizza-size-selector"
import ToppingsList from "./pizza-topping-list"
import PizzaCanvas from "./pizza-canvas"
import PriceDisplay from "./pizza-price-display"

import { useState, useMemo } from "react"
import { useCartStore } from "stores/cart"
import { useToastStore } from "stores/toast"
import { STORE_CONFIG } from "shared/cfg/store-config"
import { PRODUCT_TYPE } from "shared/util/types"
import { calculatePizzaPriceBreakdown } from "shared/lib/calculations"

import type { TSize, TTopping, TPizza } from "shared/util/types"

import style from "./pizza-configurator.module.scss"

interface PizzaConfiguratorProps {
  sizes: TSize[]
  toppings: TTopping[]
  defaultPizza?: TPizza
}

export default function PizzaConfigurator({ sizes, toppings }: PizzaConfiguratorProps) {
  const [selectedSize, setSelectedSize] = useState<TSize | null>(sizes[0] || null)
  const [selectedToppings, setSelectedToppings] = useState<TTopping[]>([])

  const { addCartItem } = useCartStore()
  const { addToast } = useToastStore()

  const visibleToppings = useMemo(() => toppings.filter((t) => !t.isHidden), [toppings])
  const priceBreakdown = useMemo(() => {
    if (!selectedSize) {
      return { basePrice: 0, toppingsPrice: 0, total: 0 }
    }

    return calculatePizzaPriceBreakdown(selectedSize, selectedToppings)
  }, [selectedSize, selectedToppings])

  const handleToppingToggle = (topping: TTopping) => {
    if (
      !selectedToppings.some((t) => t.id === topping.id) &&
      selectedToppings.length >= STORE_CONFIG.validation.maxToppings
    ) {
      addToast({
        type: "error",
        text: `You can only select up to ${STORE_CONFIG.validation.maxToppings} toppings.`,
      })

      return
    }

    setSelectedToppings((prev) => {
      const exists = prev.some((t) => t.id === topping.id)
      if (exists) {
        return prev.filter((t) => t.id !== topping.id)
      } else {
        const newSelection = [...prev, topping]
        return newSelection.sort((a, b) => {
          const indexA = visibleToppings.findIndex((t) => t.id === a.id)
          const indexB = visibleToppings.findIndex((t) => t.id === b.id)
          return indexA - indexB
        })
      }
    })
  }

  const handleAddToCart = () => {
    const customPizza: TPizza = {
      name: "custom",
      pizzaType: "generated",
    }

    addCartItem(PRODUCT_TYPE.PIZZA, {
      productType: PRODUCT_TYPE.PIZZA,
      pizza: customPizza,
      pizzaSize: selectedSize as TSize,
      pizzaToppings: selectedToppings.map((t) => ({ ...t, id: t.id! })),
    })
  }

  return (
    <div className={style.PizzaConfigurator}>
      <SizeSelector
        sizes={sizes}
        selectedSize={selectedSize}
        onSizeChange={setSelectedSize}
      />

      <div className={style.toppings}>
        <ToppingsList
          toppings={visibleToppings}
          selectedToppings={selectedToppings}
          selectedSize={selectedSize}
          onToppingToggle={handleToppingToggle}
        />
      </div>

      <div className={style.preview}>
        <PizzaCanvas
          sizes={sizes}
          selectedSize={selectedSize}
          selectedToppings={selectedToppings}
        />
      </div>

      <div className={style.price}>
        <PriceDisplay
          basePrice={priceBreakdown.basePrice}
          total={priceBreakdown.total}
          onAddToCart={handleAddToCart}
        />
      </div>

      {selectedToppings.length < STORE_CONFIG.toppings.maxFree && (
        <div className={style.info}>
          <span>
            <span>Select</span>
            <i>{Math.max(0, STORE_CONFIG.toppings.maxFree - selectedToppings.length)}</i>
            <span>
              more free topping
              {selectedToppings.length === STORE_CONFIG.toppings.maxFree - 1 ? "" : "s"}
            </span>
          </span>
        </div>
      )}
    </div>
  )
}
