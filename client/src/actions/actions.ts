"use server"

import directus from "lib/directus"
import type { Drink, Showcase, Size, Topping } from "shared/util/directus-types"

export type ActionResult<T = any> = {
  success: boolean
  data?: T
  error?: string
}
export interface PizzaConfiguratorData {
  sizes: ActionResult<Size[]>
  toppings: ActionResult<Topping[]>
}

const handleError = (error: unknown): ActionResult => {
  console.error("Directus server action error", error)
  return {
    success: false,
    error: error instanceof Error ? error.message : "An unknown error occurred",
  }
}

export async function getShowcases(): Promise<ActionResult<Showcase[]>> {
  try {
    const data = await directus.readItems("showcase", {
      limit: 12,
      fields: [
        "title",
        {
          pizzas: [
            "*",
            {
              pizzas_id: [
                {
                  toppings: ["*"],
                },
              ],
            },
          ],
        },
      ],
    })

    return { success: true, data }
  } catch (error) {
    return handleError(error)
  }
}

export async function getToppings(): Promise<ActionResult<Topping[]>> {
  try {
    const data = await directus.readItems("toppings", {
      fields: ["*", { icon: ["id"] }],
    })

    return { success: true, data }
  } catch (error) {
    return handleError(error)
  }
}

export async function getSizes(): Promise<ActionResult<Size[]>> {
  try {
    const data = await directus.readItems("sizes", {
      fields: ["*"],
    })

    return { success: true, data }
  } catch (error) {
    return handleError(error)
  }
}

export async function getPizzaConfiguratorData(): Promise<
  ActionResult<PizzaConfiguratorData>
> {
  try {
    const sizes = await getSizes()
    const toppings = await getToppings()
    const data = { sizes, toppings }

    return { success: true, data }
  } catch (error) {
    return handleError(error)
  }
}

export async function getDrinks(): Promise<ActionResult<Drink[]>> {
  try {
    const data = await directus.readItems("drinks", {
      fields: ["*", { image: ["id"] }],
    })

    return { success: true, data }
  } catch (error) {
    return handleError(error)
  }
}
