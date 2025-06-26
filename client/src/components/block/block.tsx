import React from "react"
import { cs } from "shared/util/util"

import style from "./block.module.scss"

export interface BlockProps {
  className?: string
  backgroundColor?: "purple" | "creme"
  label: string
  value: string
}

export default function Block({
  className,
  label,
  value,
  backgroundColor = "purple",
}: BlockProps) {
  return (
    <div className={cs(style.Block, className, style[backgroundColor])}>
      <span className={style.label}>{label}</span>
      <span className={style.value}>{value}</span>
    </div>
  )
}
