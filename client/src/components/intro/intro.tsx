"use client"

import React, { createContext, useContext, useEffect, useState } from "react"
import PizzaButton from "../pizza-button/pizza-button"
import Logo from "../logo/logo"

import style from "./intro.module.scss"

export interface IntroContext {
  hide: () => void
}

const IntroContext = createContext<IntroContext | null>(null)

export const useIntro = () => {
  const context = useContext(IntroContext)
  if (!context) {
    throw new Error("useIntro must be used within an IntroProvider")
  }
  return context
}

export interface IntroProviderProps {
  children: React.ReactNode
}

export function IntroProvider({ children }: IntroProviderProps) {
  const [isVisible, setIsVisible] = useState(true)

  const hide = () => {
    setIsVisible(false)
  }

  return (
    <IntroContext.Provider value={{ hide }}>
      {isVisible && <Intro />}
      {children}
    </IntroContext.Provider>
  )
}

export default function Intro() {
  const { hide } = useIntro()

  useEffect(() => {
    document.body.style.overflow = "hidden"

    return () => {
      document.body.style.overflow = ""
    }
  }, [])

  return (
    <div className={style.Intro} data-intro>
      <div className={style.rays}></div>
      <div className={style.logo}>
        <div className={style.content}>
          <Logo />
          <PizzaButton className={style.button} onClick={hide}>
            Enter store
          </PizzaButton>
        </div>
      </div>
    </div>
  )
}
