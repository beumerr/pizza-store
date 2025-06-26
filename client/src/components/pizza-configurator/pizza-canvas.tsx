import { usePizzaCanvas } from "@/components/pizza-configurator/pizza-renderer"
import { PIZZA_CONFIG } from "shared/cfg/pizza-config"

import type { TSize, TTopping } from "stores/cart"

interface PizzaCanvasProps {
  sizes: TSize[]
  selectedSize: TSize | null
  selectedToppings: TTopping[]
}

export default function PizzaCanvas({
  sizes,
  selectedSize,
  selectedToppings,
}: PizzaCanvasProps) {
  const canvasRef = usePizzaCanvas({
    sizes,
    selectedSize,
    selectedToppings,
  })

  return (
    <div className="PizzaCanvas">
      <canvas
        ref={canvasRef}
        width={PIZZA_CONFIG.canvas.width}
        height={PIZZA_CONFIG.canvas.height}
      />
    </div>
  )
}
