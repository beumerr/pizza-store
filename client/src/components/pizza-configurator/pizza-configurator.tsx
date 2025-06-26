"use client"

import SizeSelector from "./pizza-size-selector"
import ToppingsList from "./pizza-topping-list"
import PizzaCanvas from "./pizza-canvas"

import { useState, useMemo } from "react"
import { useCartStore, PRODUCT_TYPE } from "stores/cart"
import { calculatePizzaPriceBreakdown } from "shared/lib/calculations"
import type { TSize, TTopping, TPizza } from "stores/cart"

import style from "./pizza-configurator.module.scss"
import { PIZZA_CONFIG } from "shared/cfg/pizza-config"

interface PizzaConfiguratorProps {
  sizes: TSize[]
  toppings: TTopping[]
  defaultPizza?: TPizza
}

export default function PizzaConfigurator({ sizes, toppings }: PizzaConfiguratorProps) {
  const [selectedSize, setSelectedSize] = useState<TSize | null>(sizes[0] || null)
  const [selectedToppings, setSelectedToppings] = useState<TTopping[]>([])

  const { addCartItem } = useCartStore()

  const visibleToppings = useMemo(() => toppings.filter((t) => !t.isHidden), [toppings])
  const priceBreakdown = useMemo(() => {
    if (!selectedSize) {
      return { basePrice: 0, toppingsPrice: 0, total: 0 }
    }
    return calculatePizzaPriceBreakdown(selectedSize, selectedToppings)
  }, [selectedSize, selectedToppings])

  const handleToppingToggle = (topping: TTopping) => {
    if (selectedToppings.length >= PIZZA_CONFIG.validation.maxToppings) {
      alert(`You can only select up to ${PIZZA_CONFIG.validation.maxToppings} toppings.`)
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
    if (!selectedSize) {
      alert("Select a format")
      return
    }

    if (selectedToppings.length < PIZZA_CONFIG.validation.minToppings) {
      alert("You must select at least 2 toppings")
      return
    }

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
    </div>
  )
}
