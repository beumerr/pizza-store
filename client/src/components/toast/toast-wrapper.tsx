"use client"

import React, {
  useRef,
  useLayoutEffect,
  useEffect,
  ReactNode,
  useCallback,
  useState,
} from "react"
import Toast from "./toast"
import gsap from "gsap"

import { createPortal } from "react-dom"
import { useToastStore, setRemoveToastCallback } from "stores/toast"

import style from "./toast.module.scss"

export interface ToastWrapperProps {
  children: ReactNode
}

export default function ToastWrapper({ children }: ToastWrapperProps) {
  const { toasts, removingToasts, setRemoving, finishRemove } = useToastStore()
  const [mounted, setMounted] = useState(false)
  const toastRefs = useRef<Record<number, HTMLElement>>({})

  useEffect(() => {
    setMounted(true)
  }, [])

  const removeToast = useCallback(
    (id: number) => {
      const el = toastRefs.current[id]
      if (!el) return

      setRemoving(id)

      gsap.to(el, {
        x: "120%",
        duration: 0.4,
        ease: "Expo.easeInOut",
        onComplete: () => {
          finishRemove(id)
          delete toastRefs.current[id]
        },
      })
    },
    [setRemoving, finishRemove]
  )

  useEffect(() => {
    setRemoveToastCallback(removeToast)
  }, [removeToast])

  useLayoutEffect(() => {
    if (!mounted) return

    const height = 52
    const activeToasts = toasts.filter((toast) => !removingToasts.has(toast.id))
    const count = activeToasts.length

    activeToasts.forEach((toast, index) => {
      const ref = toastRefs.current[toast.id]
      if (ref) {
        const offset = -(count - 1 - index) * height
        gsap.to(ref, {
          y: offset,
          duration: 0.4,
          ease: "power2.out",
        })
      }
    })
  }, [toasts, removingToasts, mounted])

  return (
    <>
      {children}
      {mounted &&
        createPortal(
          <div className={style.toastWrapper}>
            <div className={style.toastContainer}>
              {toasts.map((toast) => (
                <Toast
                  key={toast.id}
                  toast={toast}
                  onRemove={() => removeToast(toast.id)}
                  setRef={(el: HTMLElement | null) => {
                    if (el) {
                      toastRefs.current[toast.id] = el
                    }
                  }}
                />
              ))}
            </div>
          </div>,
          document.body
        )}
    </>
  )
}
