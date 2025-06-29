import CartSummary from "@/components/cart-summary/cart-summary"
import PizzaWrapper from "@/components/pizza-configurator/pizza-wrapper"
import Showcase from "@/components/showcase/showcase"
import PizzaButton from "@/components/pizza-button/pizza-button"
import ToastWrapper from "@/components/toast/toast-wrapper"

import { EmblaProvider, EmblaSlider } from "@/components/embla/embla"
import { getDrinks, getSizes, getToppings } from "@/actions/actions"
import { IntroProvider } from "@/components/intro/intro"

import style from "./page.module.scss"

export default async function Home() {
  const sizes = await getSizes()
  const drinks = await getDrinks()
  const toppings = await getToppings()

  return (
    <ToastWrapper>
      <EmblaProvider>
        <IntroProvider>
          <div className={style.container}>
            <EmblaSlider className={style.slider}>
              <PizzaWrapper sizes={sizes.data} toppings={toppings.data} />
              <Showcase sizes={sizes.data} />
            </EmblaSlider>
            <div className={style.sidebar}>
              <PizzaButton priority />
              <CartSummary drinks={drinks.data} />
            </div>
          </div>
        </IntroProvider>
      </EmblaProvider>
    </ToastWrapper>
  )
}
