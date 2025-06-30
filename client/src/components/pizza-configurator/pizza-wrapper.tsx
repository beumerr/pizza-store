import React from "react"
import PizzaConfigurator from "./pizza-configurator"

import { TSize, TTopping } from "shared/util/types"

import style from "./pizza-configurator.module.scss"

export interface PizzaWrapperProps {
  sizes?: TSize[]
  toppings?: TTopping[]
}

export default async function PizzaWrapper({ sizes, toppings }: PizzaWrapperProps) {
  if (!sizes?.length || !toppings?.length) {
    return null
  }

  return (
    <div className={style.PizzaWrapper}>
      <PizzaConfigurator sizes={sizes} toppings={toppings} />
    </div>
  )
}
