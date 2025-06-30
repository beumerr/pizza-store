import React from "react"
import PizzaConfigurator from "./pizza-configurator"

import { TSize, TTopping } from "shared/util/types"

export interface PizzaWrapperProps {
  sizes?: TSize[]
  toppings?: TTopping[]
}

export default async function PizzaWrapper({ sizes, toppings }: PizzaWrapperProps) {
  if (!sizes?.length || !toppings?.length) {
    return null
  }

  return <PizzaConfigurator sizes={sizes} toppings={toppings} />
}
