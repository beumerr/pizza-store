"use client"

import React from "react"
import Button from "../button/button"

import { useEmbla } from "../embla/embla"
import { cs } from "shared/util/util"

import style from "./pizza-button.module.scss"
import Image from "next/image"

export interface PizzaButtonProps {
  className?: string
  text?: string
  onClick?: () => void
}

export default function PizzaButton({ className, text, onClick }: PizzaButtonProps) {
  const { scrollNext, selectedIndex } = useEmbla()

  return (
    <div className={cs(style.PizzaButton, className)}>
      <Image
        src={`/assets/img/png/happy-pizza.png`}
        alt="Happy pizza"
        width={142}
        height={130}
      />
      <Button
        className={style.button}
        size="custom"
        color="orange"
        onClick={onClick ?? scrollNext}>
        {text ?? (selectedIndex === 0 ? "View pizzas" : "View configurator")}
      </Button>
    </div>
  )
}
