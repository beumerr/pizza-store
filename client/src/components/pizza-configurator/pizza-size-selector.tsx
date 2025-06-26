import type { TSize } from "shared/util/types"

import style from "./pizza-configurator.module.scss"

interface SizeSelectorProps {
  sizes: TSize[]
  selectedSize: TSize | null
  onSizeChange: (size: TSize) => void
}

export default function SizeSelector({
  sizes,
  selectedSize,
  onSizeChange,
}: SizeSelectorProps) {
  return (
    <div className={style.SizeSelector}>
      <label className={style.label}>Format</label>
      <select
        className={style.dropdown}
        value={selectedSize?.id || ""}
        onChange={(e) => {
          const size = sizes.find((s) => s.id === parseInt(e.target.value))
          if (size) onSizeChange(size)
        }}>
        {!selectedSize && <option value="">Choose format</option>}
        {sizes.map((size) => (
          <option key={size.id} value={size.id}>
            {size.sizeLabel} ({size.sizeDiameter}CM)
          </option>
        ))}
      </select>
    </div>
  )
}
