import { useEffect, useRef, useMemo } from "react"
import { STORE_CONFIG, ToppingSize } from "shared/cfg/store-config"

import type { TSize, TTopping } from "shared/util/types"

export interface UsePizzaCanvasProps {
  sizes: TSize[]
  selectedSize: TSize | null
  selectedToppings: TTopping[]
}

export const usePizzaCanvas = ({
  sizes,
  selectedSize,
  selectedToppings,
}: UsePizzaCanvasProps) => {
  const canvasRef = useRef<HTMLCanvasElement>(null)
  const imageCache = useRef<Map<string, HTMLImageElement>>(new Map())
  const directusUrl = process.env.NEXT_PUBLIC_DIRECTUS_URL || ""

  const pizzaDiameter = useMemo(() => {
    if (!selectedSize) return STORE_CONFIG.canvas.width * 0.8

    const allSizes = sizes.map((s) => parseInt(s.sizeDiameter))
    const minSize = Math.min(...allSizes)
    const maxSize = Math.max(...allSizes)

    const maxDiameter = STORE_CONFIG.canvas.width * 0.9
    const minDiameter = STORE_CONFIG.canvas.width * 0.5

    const sizeNum = parseInt(selectedSize.sizeDiameter)
    const normalized = (sizeNum - minSize) / (maxSize - minSize)

    return minDiameter + (maxDiameter - minDiameter) * normalized
  }, [sizes, selectedSize])

  useEffect(() => {
    const canvas = canvasRef.current
    if (!canvas) return

    const ctx = canvas.getContext("2d")
    if (!ctx) return

    const renderPizza = async () => {
      ctx.clearRect(0, 0, canvas.width, canvas.height)

      try {
        let baseImg = imageCache.current.get("base")
        if (!baseImg) {
          baseImg = await loadSVGFromDirectus(STORE_CONFIG.basePizzaSvgId, directusUrl)
          imageCache.current.set("base", baseImg)
        }

        const baseX = (canvas.width - pizzaDiameter) / 2
        const baseY = (canvas.height - pizzaDiameter) / 2
        ctx.drawImage(baseImg, baseX, baseY, pizzaDiameter, pizzaDiameter)
      } catch (error) {
        console.error("Failed to load pizza base", error)
      }

      for (const topping of selectedToppings) {
        try {
          const iconId = typeof topping.icon === "string" ? topping.icon : topping.icon.id
          let toppingImg = imageCache.current.get(iconId)

          if (!toppingImg) {
            toppingImg = await loadSVGFromDirectus(iconId, directusUrl)
            imageCache.current.set(iconId, toppingImg)
          }

          const toppingSize = (topping.displaySize as ToppingSize) || "medium"
          const positions = generateToppingPositions(
            canvas.width,
            toppingSize,
            pizzaDiameter
          )

          for (const position of positions) {
            drawToppingOnCanvas(ctx, toppingImg, position)
          }
        } catch (error) {
          console.error(`Failed to load topping ${topping.name}`, error)
        }
      }
    }

    renderPizza()
  }, [selectedToppings, pizzaDiameter, directusUrl])

  return canvasRef
}

export interface ToppingPosition {
  x: number
  y: number
  scale: number
  rotation: number
}

export const generateToppingPositions = (
  canvasSize: number,
  toppingSize: ToppingSize,
  pizzaDiameter: number
): ToppingPosition[] => {
  const config = STORE_CONFIG.toppings[toppingSize]
  const distribution = STORE_CONFIG.distribution

  if (toppingSize === "large") {
    if (!("scale" in config)) {
      throw new Error(`Invalid topping configuration for size: ${toppingSize}`)
    }

    return [
      {
        x: canvasSize / 2,
        y: canvasSize / 2,
        scale: pizzaDiameter * config.scale,
        rotation: 0,
      },
    ]
  }

  if (!("count" in config) || !("scale" in config)) {
    throw new Error(`Invalid topping configuration for size: ${toppingSize}`)
  }

  const positions: ToppingPosition[] = []
  const count = config.count
  const radius = pizzaDiameter / 2 - STORE_CONFIG.canvas.crustOffset

  for (let i = 0; i < count; i++) {
    const angle = Math.random() * Math.PI * 2
    const minDist = radius * distribution.minDistance
    const maxDist = radius * distribution.maxDistance
    const distance = Math.sqrt(Math.random()) * (maxDist - minDist) + minDist

    positions.push({
      x: canvasSize / 2 + Math.cos(angle) * distance,
      y: canvasSize / 2 + Math.sin(angle) * distance,
      scale: pizzaDiameter * config.scale,
      rotation: Math.random() * distribution.maxRotation,
    })
  }

  return positions
}

export const loadSVGFromDirectus = async (
  iconId: string,
  directusUrl: string
): Promise<HTMLImageElement> => {
  return new Promise((resolve, reject) => {
    const img = new Image()
    img.onload = () => resolve(img)
    img.onerror = reject
    img.src = `${directusUrl}/assets/${iconId}`
  })
}

export const drawToppingOnCanvas = (
  ctx: CanvasRenderingContext2D,
  img: HTMLImageElement,
  position: ToppingPosition
) => {
  ctx.save()

  ctx.translate(position.x, position.y)
  ctx.rotate((position.rotation * Math.PI) / 180)
  ctx.drawImage(
    img,
    -position.scale / 2,
    -position.scale / 2,
    position.scale,
    position.scale
  )

  ctx.restore()
}
