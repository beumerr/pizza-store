import { useCartStore } from "stores/cart"
import { getTitle, cs, formatPrice } from "shared/util/util"

import style from "./cart-summary.module.scss"

export default function PriceList() {
  const { items, removeItem } = useCartStore()

  return (
    <div className={cs(style.PriceList)}>
      <ul>
        {items?.length ? (
          items.map((item) => {
            const { name, sub } = getTitle(item)
            return (
              <li key={item.uid}>
                <div className={style.content}>
                  <span className={style.name}>{name}</span>
                  <span className={style.sub}>{sub}</span>
                </div>
                <div className={style.controls}>
                  <span className={style.price}>{formatPrice(item.itemPrice)}</span>
                  <button onClick={() => removeItem(item.uid)} className={style.remove}>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 79.51 82">
                      <path d="m78.6,69.2l-28.2-28.2,28.2-28.2c1.2-1.2,1.2-3.1,0-4.2L70.1.1l-30.3,30.3L9.4,0,.9,8.5c-1.2,1.2-1.2,3.1,0,4.2l28.2,28.2L1,69.2c-1.2,1.2-1.2,3.1,0,4.2l8.5,8.5,30.3-30.3,30.4,30.4,8.5-8.5c1.1-1.2,1.1-3.1-.1-4.3Z" />
                    </svg>
                  </button>
                </div>
              </li>
            )
          })
        ) : (
          <li>
            <div className={style.content}>
              <span className={cs(style.sub, style.empty)}>Cart is empty</span>
            </div>
          </li>
        )}
      </ul>
    </div>
  )
}
