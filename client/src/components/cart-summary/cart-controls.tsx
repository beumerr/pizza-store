import React from "react"
import Button from "components/button/button"
import Block from "../block/block"

import { useCartStore } from "stores/cart"
import { cs, formatPrice } from "shared/util/util"

import style from "./cart-summary.module.scss"

export default function CartControls() {
  const { submitOrder, total, discountAmount } = useCartStore()

  return (
    <div className={cs(style.CartControls)}>
      <Block
        backgroundColor="creme"
        label="Discount"
        value={formatPrice(discountAmount)}
      />
      <Block label="Total" value={formatPrice(total)} />
      <Button
        onClick={submitOrder}
        className={style.checkout}
        size="medium"
        color="green">
        Order now
      </Button>
    </div>
  )
}
