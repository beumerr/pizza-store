import React from "react"
import PizzaConfigurator from "./pizza-configurator"

import { getPizzaConfiguratorData } from "@/actions/actions"

import style from "./pizza-configurator.module.scss"

export default async function PizzaWrapper() {
  const { data, error } = await getPizzaConfiguratorData()
  const { sizes, toppings } = data || {}

  const Wrapper = ({ children }: React.PropsWithChildren) => {
    return <div className={style.PizzaWrapper}>{children}</div>
  }

  if (error) {
    return (
      <Wrapper>
        <span className={style.error}>Error loading pizza configurator</span>
      </Wrapper>
    )
  }

  if (!sizes?.data) {
    return (
      <Wrapper>
        <span className={style.error}>No sizes available</span>
      </Wrapper>
    )
  }

  if (!toppings?.data) {
    return (
      <Wrapper>
        <span className={style.error}>No toppings available</span>
      </Wrapper>
    )
  }

  return (
    <Wrapper>
      <PizzaConfigurator sizes={sizes.data} toppings={toppings.data} />
    </Wrapper>
  )
}
