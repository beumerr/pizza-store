import { describe, it, expect, vi } from "vitest"
import {
  validatePizza,
  validateSize,
  validateToppings,
  validateCartItems,
} from "../lib/validations"
import { PRODUCT_TYPE } from "../util/types"
import type {
  BaseCartItem,
  CartItem,
  DrinkCartItem,
  PizzaCartItem,
  TPizza,
  TSize,
  TTopping,
} from "../util/types"

vi.mock("../cfg/store-config", () => ({
  STORE_CONFIG: {
    validation: {
      minToppings: 2,
      maxToppings: 8,
      maxItems: 10,
    },
  },
}))

const mockPizza: TPizza = {
  name: "Mock pizza",
  toppings: [1, 2, 3],
  image: "image.jpg",
  pizzaType: "custom",
}

const mockSize: TSize = {
  id: 1,
  sizeLabel: "Small",
  sizeDiameter: "25",
  priceCm2: 0.04,
}

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
    name: "Cheese",
    priceBase: 1.25,
    priceCm2: 0.009,
    icon: "icon.svg",
    isHidden: false,
    displaySize: "small",
  },
]

type PizzaCartItemWithPrice = PizzaCartItem & BaseCartItem

type DrinkCartItemWithPrice = DrinkCartItem & BaseCartItem

const createMockCartItem = (
  overrides: Partial<PizzaCartItemWithPrice> = {}
): PizzaCartItemWithPrice => ({
  uid: "test-123",
  quantity: 1,
  pizza: mockPizza,
  pizzaSize: mockSize,
  productType: PRODUCT_TYPE.PIZZA,
  pizzaToppings: mockToppings.slice(0, 2),
  itemPrice: 6.95,
  ...overrides,
})

describe("validateSize", () => {
  it("should return false for valid size", () => {
    const result = validateSize(mockSize)
    expect(result).toBe(false)
  })

  it("should return error message for null size", () => {
    const result = validateSize(null)
    expect(result).toBe("Select a size")
  })

  it("should return error message for undefined size", () => {
    const result = validateSize(undefined as any)
    expect(result).toBe("Select a size")
  })
})

describe("validateToppings", () => {
  it("should return false for valid topping count", () => {
    const validToppings = mockToppings.slice(0, 2) // 2 toppings
    const result = validateToppings(validToppings)
    expect(result).toBe(false)
  })

  it("should return error for too few toppings", () => {
    const fewToppings = mockToppings.slice(0, 1) // 1 topping
    const result = validateToppings(fewToppings)
    expect(result).toBe("You must select at least 2 toppings")
  })

  it("should return error for no toppings", () => {
    const result = validateToppings([])
    expect(result).toBe("You must select at least 2 toppings")
  })

  it("should return error for undefined toppings", () => {
    const result = validateToppings(undefined)
    expect(result).toBe("You must select at least 2 toppings")
  })

  it("should return error for too many toppings", () => {
    const manyToppings = Array(9)
      .fill(null)
      .map((_, i) => ({
        id: i + 1,
        name: `Topping ${i + 1}`,
        priceBase: 1.0,
        priceCm2: 0.01,
        icon: "icon.svg",
        isHidden: false,
        displaySize: "small",
      }))

    const result = validateToppings(manyToppings)
    expect(result).toBe("You can only select up to 8 toppings")
  })

  it("should return false for maximum allowed toppings", () => {
    const maxToppings = Array(8)
      .fill(null)
      .map((_, i) => ({
        id: i + 1,
        name: `Topping ${i + 1}`,
        priceBase: 1.0,
        priceCm2: 0.01,
        icon: "icon.svg",
        isHidden: false,
        displaySize: "small",
      }))

    const result = validateToppings(maxToppings)
    expect(result).toBe(false)
  })
})

describe("validatePizza", () => {
  it("should return false for valid pizza configuration", () => {
    const validToppings = mockToppings.slice(0, 2)
    const result = validatePizza(mockSize, validToppings)
    expect(result).toBe(false)
  })

  it("should return size error when size is invalid", () => {
    const result = validatePizza(null, mockToppings.slice(0, 2))
    expect(result).toBe("Select a size")
  })

  it("should return toppings error when toppings are invalid", () => {
    const result = validatePizza(mockSize, [])
    expect(result).toBe("You must select at least 2 toppings")
  })

  it("should prioritize size validation over toppings", () => {
    // Both size and toppings are invalid
    const result = validatePizza(null, [])
    expect(result).toBe("Select a size") // Size error comes first
  })

  it("should handle undefined toppings", () => {
    const result = validatePizza(mockSize, undefined)
    expect(result).toBe("You must select at least 2 toppings")
  })
})

describe("validateCartItems", () => {
  it("should return false for valid cart items", () => {
    const validItems = [createMockCartItem(), createMockCartItem({ uid: "test-456" })]

    const result = validateCartItems(validItems)
    expect(result).toBe(false)
  })

  it("should return error for empty cart", () => {
    const result = validateCartItems([])
    expect(result).toBe("Your cart is empty")
  })

  it("should return error for undefined cart", () => {
    const result = validateCartItems(undefined)
    expect(result).toBe("Your cart is empty")
  })

  it("should return error for too many items", () => {
    const manyItems = Array(11)
      .fill(null)
      .map((_, i) => createMockCartItem({ uid: `test-${i}` }))

    const result = validateCartItems(manyItems)
    expect(result).toBe("You can only have up to 10 items in your cart")
  })

  it("should validate individual pizza items", () => {
    const invalidPizzaItem = createMockCartItem({
      pizzaSize: null as any, // Invalid size
    })

    const result = validateCartItems([invalidPizzaItem])
    expect(result).toBe("Select a size")
  })

  it("should validate pizza with invalid toppings", () => {
    const invalidPizzaItem = createMockCartItem({
      pizzaToppings: [], // Too few toppings
    })

    const result = validateCartItems([invalidPizzaItem])
    expect(result).toBe("You must select at least 2 toppings")
  })

  it("should handle drink items without validation errors", () => {
    const drinkItem: DrinkCartItemWithPrice = {
      uid: "drink-123",
      productType: PRODUCT_TYPE.DRINK,
      quantity: 1,
      itemPrice: 2.5,
      drink: {
        id: 1,
        name: "Coke",
        price: 2.5,
        image: "coke.jpg",
      },
    }

    const result = validateCartItems([drinkItem])
    expect(result).toBe(false)
  })

  it("should validate mixed cart with pizza and drink items", () => {
    const mixedItems = [
      createMockCartItem(),
      {
        uid: "drink-123",
        productType: PRODUCT_TYPE.DRINK,
        quantity: 1,
        itemPrice: 2.5,
        drink: {
          id: 1,
          name: "Coke",
          price: 2.5,
          image: "coke.jpg",
        },
      },
    ] as CartItem[]

    const result = validateCartItems(mixedItems)
    expect(result).toBe(false)
  })

  it("should stop at first validation error", () => {
    const items = [
      createMockCartItem({ pizzaSize: null as any }), // Invalid size
      createMockCartItem({ pizzaToppings: [] }), // Invalid toppings
    ]

    const result = validateCartItems(items)
    // Should return the first error encountered
    expect(result).toBe("Select a size")
  })

  it("should handle maximum allowed items", () => {
    const maxItems = Array(10)
      .fill(null)
      .map((_, i) => createMockCartItem({ uid: `test-${i}` }))

    const result = validateCartItems(maxItems)
    expect(result).toBe(false)
  })
})
