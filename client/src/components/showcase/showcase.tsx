import React from "react"
import Tile from "../tile/tile"

import { getShowcases } from "@/actions/actions"
import { Size } from "shared/util/directus-types"
import { PizzaCartItem, PRODUCT_TYPE } from "shared/util/types"
import {
  isPopulatedShowcasePizza,
  isPopulatedPizza,
  isPopulatedPizzasTopping,
  isPopulatedTopping,
} from "shared/util/util"

import style from "./showcase.module.scss"

export interface ShowcaseProps {
  sizes?: Size[]
}

export default async function Showcase({ sizes }: ShowcaseProps) {
  const showcase = await getShowcases()

  if (!sizes?.length || !showcase.data) {
    return null
  }

  return (
    <div className={style.Showcase}>
      {showcase.data.map((item, showcaseIndex) => {
        return (
          <div key={`showcase_${showcaseIndex}`} className={style.item}>
            <h2 className={style.title}>{item.title}</h2>

            <div className={style.rows}>
              {item.pizzas.filter(isPopulatedShowcasePizza).map((pizza, pizzaIndex) => {
                if (!isPopulatedPizza(pizza.pizzas_id)) {
                  console.warn("Pizza not populated")
                  return null
                }

                const pizzaData = pizza.pizzas_id
                const populatedToppings = pizzaData.toppings
                  .filter(isPopulatedPizzasTopping)
                  .map((pt) => pt.toppings_id)
                  .filter(isPopulatedTopping)

                const cartItem: PizzaCartItem = {
                  productType: PRODUCT_TYPE.PIZZA,
                  pizza: pizzaData,
                  pizzaSize: sizes[0],
                  pizzaToppings: populatedToppings,
                }

                return (
                  <Tile
                    key={`tile_${pizzaData.id}`}
                    id={pizzaData.id}
                    image={pizzaData.image}
                    name={pizzaData.name}
                    sub={populatedToppings.map((t) => t.name).join(", ")}
                    toppings={populatedToppings}
                    sizes={sizes}
                    product={cartItem}
                    productType={PRODUCT_TYPE.PIZZA}
                    priority={showcaseIndex === 0 && pizzaIndex < 4}
                  />
                )
              })}
            </div>
          </div>
        )
      })}
    </div>
  )
}
