import style from "./pizza-configurator.module.scss"
import Button from "../button/button"
import Block from "../block/block"

import { formatPrice } from "shared/util/util"

interface PriceDisplayProps {
  basePrice: number
  total: number
  onAddToCart: () => void
}

export default function PriceDisplay({
  basePrice,
  total,
  onAddToCart,
}: PriceDisplayProps) {
  return (
    <div className={style.PriceDisplay}>
      <Block backgroundColor="creme" label="From" value={formatPrice(basePrice)} />
      <Block label="Price" value={formatPrice(total)} />
      <Button className={style.submit} size="medium" color="green" onClick={onAddToCart}>
        Add
      </Button>
    </div>
  )
}
