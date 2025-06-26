import CartSummary from "@/components/cart-summary/cart-summary"
import PizzaWrapper from "@/components/pizza-configurator/pizza-wrapper"
import { getShowcases } from "actions/actions"

export default async function Home() {
  return (
    <>
      <PizzaWrapper />
      <CartSummary />
    </>
  )
}
