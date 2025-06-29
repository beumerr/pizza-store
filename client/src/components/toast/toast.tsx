import React, { useEffect, useRef, useState } from "react"
import gsap from "gsap"

import { Toast as ToastType, ToastType as ToastTypeEnum } from "stores/toast"
import { InfoIcon, SuccessIcon, ErrorIcon, WarningIcon } from "./toast-icons"
import { cs } from "shared/util/util"
import { CSSProperties } from "react"

import style from "./toast.module.scss"

interface ToastProps {
  toast: ToastType
  setRef: (el: HTMLElement | null) => void
  onRemove: () => void
}

export default function Toast({ toast, setRef, onRemove }: ToastProps) {
  const ref = useRef<HTMLButtonElement>(null)
  const hasAnimated = useRef(false)
  const [pointerEvent, setPointerEvent] = useState<CSSProperties["pointerEvents"]>("auto")

  useEffect(() => {
    if (ref.current && !hasAnimated.current) {
      setRef(ref.current)
      hasAnimated.current = true
      gsap.fromTo(
        ref.current,
        { x: "100%", opacity: 0 },
        { x: "0%", opacity: 1, duration: 0.4, ease: "power2.out" }
      )
    } else if (ref.current && hasAnimated.current) {
      setRef(ref.current)
    }
  }, [setRef])

  const getIcon = (type: ToastTypeEnum): React.ReactNode => {
    switch (type) {
      case "success":
        return <SuccessIcon />
      case "error":
        return <ErrorIcon />
      case "warning":
        return <WarningIcon />
      case "info":
      default:
        return <InfoIcon />
    }
  }

  const handleRemove = () => {
    setPointerEvent("none")
    onRemove()
  }

  return (
    <button
      className={cs(style.Toast, style[`toast-${toast.type}`])}
      ref={ref}
      style={{ pointerEvents: pointerEvent }}
      onClick={handleRemove}
      type="button">
      <div className={style.icon}>{getIcon(toast.type)}</div>
      <div className={style.text}>{toast.text}</div>
    </button>
  )
}
