"use server"

import directus from "../lib/directus"
import type { Showcase } from "shared/util/directus-types"

export type ActionResult<T = any> = {
  success: boolean
  data?: T
  error?: string
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
