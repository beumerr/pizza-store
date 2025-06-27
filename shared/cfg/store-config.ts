export const STORE_CONFIG = {
  validation: {
    maxToppings: 6,
    minToppings: 2,
    maxItems: 50,
  },
  toppings: {
    maxFree: 3,
    large: {
      scale: 0.8,
    },
    medium: {
      count: 5,
      scale: 0.15,
    },
    small: {
      count: 10,
      scale: 0.08,
    },
  },
  distribution: {
    minDistance: 0.1,
    maxDistance: 0.85,
    maxRotation: 360,
  },
  canvas: {
    width: 600,
    height: 600,
    crustOffset: 40,
  },

  basePizzaSvgId: "e2db0cdc-382a-4d40-b80a-24bba5c56ecf",
} as const

export type ToppingSize = "large" | "medium" | "small"
