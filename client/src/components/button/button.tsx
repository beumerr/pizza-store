import React from "react"
import { cs } from "shared/util/util"

import style from "./button.module.scss"

export interface ButtonProps {
  onClick: () => void
  children: React.ReactNode
  className?: string
  size: "small" | "medium" | "large" | "custom"
  color: "green" | "orange" | "pink"
  disabled?: boolean
}

export default function Button({
  onClick,
  children,
  className,
  size = "medium",
  color = "green",
  disabled = false,
}: ButtonProps) {
  return (
    <button
      className={cs(style.Button, className, style[size], style[color])}
      onClick={onClick}
      disabled={disabled}>
      {children}
    </button>
  )
}
