import { describe, it, expect } from "vitest"
import {
  calculatePizzaBasePrice,
  calculatePizzaPriceBreakdown,
  calculateSingleToppingPrice,
  calculatePizzaToppingsPrice,
} from "../lib/calculations"
import type { TSize, TTopping } from "../util/types"

const mockSizes: TSize[] = [
  {
    id: 1,
    sizeLabel: "Small",
    sizeDiameter: "20",
    priceCm2: 0.05,
  },
  {
    id: 2,
    sizeLabel: "Medium",
    sizeDiameter: "25",
    priceCm2: 0.04,
  },
  {
    id: 3,
    sizeLabel: "Large",
    sizeDiameter: "30",
    priceCm2: 0.035,
  },
]

const mockToppings: TTopping[] = [
  {
    id: 1,
    name: "Pepperoni",
    priceBase: 1.5,
    priceCm2: 0.01,
    icon: "icon.svg",
    isHidden: false,
    displaySize: "small",
  },
  {
    id: 2,
    name: "Mushrooms",
    priceBase: 1.0,
    priceCm2: 0.008,
    icon: "icon.svg",
    isHidden: false,
    displaySize: "small",
  },
  {
    id: 3,
    name: "Extra Cheese",
    priceBase: 2.0,
    priceCm2: 0.015,
    icon: "icon.svg",
    isHidden: false,
    displaySize: "small",
  },
  {
    id: 4,
    name: "Olives",
    priceBase: 1.25,
    priceCm2: 0.009,
    icon: "icon.svg",
    isHidden: false,
    displaySize: "small",
  },
  {
    id: 5,
    name: "Truffle",
    priceBase: 5.0,
    priceCm2: 0.025,
    icon: "icon.svg",
    isHidden: false,
    displaySize: "small",
  },
]

describe("calculatePizzaBasePrice", () => {
  it("should calculate correct price for pizza", () => {
    const smallSize = mockSizes[0]
    const expectedArea = Math.PI * Math.pow(parseInt(mockSizes[0].sizeDiameter) / 2, 2)
    const expectedPrice = Math.round(smallSize.priceCm2 * expectedArea * 100) / 100

    const result = calculatePizzaBasePrice(smallSize)

    expect(result).toBe(expectedPrice)
  })

  it("should handle edge case of very small diameter", () => {
    const tinySize: TSize = {
      id: 999,
      sizeLabel: "Tiny",
      sizeDiameter: "1",
      priceCm2: 1.0,
    }

    const result = calculatePizzaBasePrice(tinySize)
    expect(result).toBeGreaterThan(0)
    expect(Number.isFinite(result)).toBe(true)
  })
})

describe("calculateSingleToppingPrice", () => {
  it("should calculate topping price correctly", () => {
    const size = mockSizes[0]
    const topping = mockToppings[0]
    const area = Math.PI * Math.pow(parseInt(size.sizeDiameter) / 2, 2)
    const expectedPrice =
      Math.round((mockToppings[0].priceBase + mockToppings[0].priceCm2 * area) * 100) /
      100

    const result = calculateSingleToppingPrice(size, topping)
    expect(result).toBe(expectedPrice)
  })

  it("should scale price with pizza size", () => {
    const smallPrice = calculateSingleToppingPrice(mockSizes[0], mockToppings[0])
    const largePrice = calculateSingleToppingPrice(mockSizes[2], mockToppings[0])

    expect(largePrice).toBeGreaterThan(smallPrice)
  })
})

describe("calculatePizzaToppingsPrice", () => {
  it("should return 0 for no toppings", () => {
    const result = calculatePizzaToppingsPrice(mockSizes[0], [])
    expect(result).toBe(0)
  })

  it("should return 0 for undefined toppings", () => {
    const result = calculatePizzaToppingsPrice(mockSizes[0], undefined)
    expect(result).toBe(0)
  })

  it("should make first 3 toppings free", () => {
    const first3Toppings = mockToppings.slice(0, 3)
    const result = calculatePizzaToppingsPrice(mockSizes[0], first3Toppings)
    expect(result).toBe(0)
  })

  it("should charge for 4th+ toppings, starting with cheapest", () => {
    const allToppings = mockToppings.slice(0, 4)
    const size = mockSizes[0]
    const toppingPrices = allToppings
      .map((topping) => calculateSingleToppingPrice(size, topping))
      .sort((a, b) => a - b)

    const expectedCharge = toppingPrices[3]

    const result = calculatePizzaToppingsPrice(size, allToppings)
    expect(result).toBe(Math.round(expectedCharge * 100) / 100)
  })

  it("should handle many toppings correctly", () => {
    const manyToppings = [...mockToppings]
    const result = calculatePizzaToppingsPrice(mockSizes[0], manyToppings)

    expect(result).toBeGreaterThan(0)
    expect(Number.isFinite(result)).toBe(true)
  })
})

describe("calculatePizzaPriceBreakdown", () => {
  it("should return correct breakdown for pizza with no toppings", () => {
    const size = mockSizes[0]
    const result = calculatePizzaPriceBreakdown(size, [])

    expect(result.basePrice).toBeGreaterThan(0)
    expect(result.toppingsPrice).toBe(0)
    expect(result.total).toBe(result.basePrice)
  })

  it("should return correct breakdown for pizza with free toppings", () => {
    const size = mockSizes[1]
    const freeToppings = mockToppings.slice(0, 2)
    const result = calculatePizzaPriceBreakdown(size, freeToppings)

    expect(result.basePrice).toBeGreaterThan(0)
    expect(result.toppingsPrice).toBe(0)
    expect(result.total).toBe(result.basePrice)
  })

  it("should return correct breakdown for pizza with paid toppings", () => {
    const size = mockSizes[1]
    const manyToppings = mockToppings.slice(0, 4)
    const result = calculatePizzaPriceBreakdown(size, manyToppings)

    expect(result.basePrice).toBeGreaterThan(0)
    expect(result.toppingsPrice).toBeGreaterThan(0)
    expect(result.total).toBe(result.basePrice + result.toppingsPrice)
  })

  it("should properly round all monetary values", () => {
    const size = mockSizes[2]
    const toppings = mockToppings
    const result = calculatePizzaPriceBreakdown(size, toppings)

    expect(result.basePrice).toBe(Math.round(result.basePrice * 100) / 100)
    expect(result.toppingsPrice).toBe(Math.round(result.toppingsPrice * 100) / 100)
    expect(result.total).toBe(Math.round(result.total * 100) / 100)
  })

  it("should handle undefined toppings gracefully", () => {
    const size = mockSizes[0]
    const result = calculatePizzaPriceBreakdown(size, undefined)

    expect(result.basePrice).toBeGreaterThan(0)
    expect(result.toppingsPrice).toBe(0)
    expect(result.total).toBe(result.basePrice)
  })
})
