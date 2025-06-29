import React from "react"
import Image from "next/image"
import style from "./logo.module.scss"

export default function Logo() {
  return (
    <div className={style.Logo}>
      <Image
        className={style.iconLogo}
        src={`/assets/img/png/logo-pizza.png`}
        width={234}
        height={233}
        alt={"Logo background"}
        priority
      />
      <Image
        className={style.textLogo}
        src={`/assets/img/png/logo-text.png`}
        width={231}
        height={151}
        alt={"Logo text"}
        priority
      />
    </div>
  )
}
