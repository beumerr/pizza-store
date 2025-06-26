"use client"

import React from "react"
import PriceList from "./cart-price-list"
import CartControls from "./cart-controls"
import CartDrinkSelect from "./cart-drink-select"

import { cs } from "shared/util/util"

import style from "./cart-summary.module.scss"

export default function CartSummary() {
  return (
    <div className={cs(style.CartSummary)}>
      <span className={style.header}>Your order</span>
      <PriceList />
      <CartDrinkSelect />
      <CartControls />
    </div>
  )
}
