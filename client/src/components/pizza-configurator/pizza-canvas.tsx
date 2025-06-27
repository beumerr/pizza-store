import { usePizzaCanvas } from "@/components/pizza-configurator/pizza-renderer"
import { STORE_CONFIG } from "shared/cfg/store-config"

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
        width={STORE_CONFIG.canvas.width}
        height={STORE_CONFIG.canvas.height}
      />
    </div>
  )
}
