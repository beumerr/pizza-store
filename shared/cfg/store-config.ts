export interface StoreConfig {
  canvas: {
    width: number
    height: number
    crustOffset: number
  }
  toppings: {
    maxFree: number
    large: {
      scale: number
    }
    medium: {
      count: number
      scale: number
    }
    small: {
      count: number
      scale: number
    }
  }
  distribution: {
    minDistance: number
    maxDistance: number
    maxRotation: number
  }
  validation: {
    maxToppings: number
    minToppings: number
    maxItems: number
  }
  basePizzaSvgId: string
}

export const STORE_CONFIG: StoreConfig = {
  canvas: {
    width: 600,
    height: 600,
    crustOffset: 40,
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
  validation: {
    maxToppings: 6,
    minToppings: 2,
    maxItems: 50,
  },
  basePizzaSvgId: "e2db0cdc-382a-4d40-b80a-24bba5c56ecf",
}

export type ToppingSize = "large" | "medium" | "small"
