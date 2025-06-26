import { cs } from "shared/util/util"
import style from "./pizza-configurator.module.scss"
import Button from "../button/button"

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
      <div className={style.block}>
        <span className={style.label}>Vanaf</span>
        <span className={style.value}>€ {basePrice.toFixed(2)}</span>
      </div>

      <div className={cs(style.block, style.total)}>
        <span className={style.label}>Prijs</span>
        <span className={cs(style.value, style.large)}>€ {total.toFixed(2)}</span>
      </div>

      <Button className={style.submit} size="medium" color="green" onClick={onAddToCart}>
        Add
      </Button>
    </div>
  )
}
