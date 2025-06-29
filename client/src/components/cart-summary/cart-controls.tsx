import React, { useState } from "react"
import Button from "components/button/button"
import Block from "../block/block"

import { useCartStore } from "stores/cart"
import { cs, formatPrice } from "shared/util/util"

import style from "./cart-summary.module.scss"

export default function CartControls() {
  const { submitOrder, total, discountAmount } = useCartStore()
  const [disabled, setDisabled] = useState(false)

  const handleSubmit = async () => {
    setDisabled(true)
    try {
      await submitOrder()
    } catch (error) {
      console.error("Error submitting order:", error)
    } finally {
      setDisabled(false)
    }
  }

  return (
    <div className={cs(style.CartControls)}>
      <Block
        backgroundColor="creme"
        label="Discount"
        value={formatPrice(discountAmount)}
      />
      <Block label="Total" value={formatPrice(total)} />
      <Button
        disabled={disabled}
        onClick={handleSubmit}
        className={style.checkout}
        size="medium"
        color="green">
        Order now
      </Button>
    </div>
  )
}
