"use client"

import React from "react"
import PriceList from "./cart-price-list"
import CartControls from "./cart-controls"
import CartDrinkSelect from "./cart-drink-select"

import { Drink } from "shared/util/directus-types"
import { cs } from "shared/util/util"

import style from "./cart-summary.module.scss"

export interface CartSummaryProps {
  drinks?: Drink[]
}

export default function CartSummary({ drinks }: CartSummaryProps) {
  return (
    <div className={cs(style.CartSummary)}>
      <span className={style.header}>Your order</span>
      <PriceList />
      {!!drinks?.length && <CartDrinkSelect drinks={drinks} />}
      <CartControls />
    </div>
  )
}
