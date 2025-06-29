import React from "react"
import Image from "next/image"
import TileControls from "./tile-controls"

import { DrinkCartItem, PizzaCartItem, PRODUCT_TYPE, TTopping } from "shared/util/types"
import { DirectusFile, Size } from "shared/util/directus-types"
import { cs } from "shared/util/util"

import style from "./tile.module.scss"

export interface TileProps {
  className?: string
  id: number
  image: string | DirectusFile
  name: string
  sub?: string
  toppings: TTopping[]
  sizes: Size[]
  product: DrinkCartItem | PizzaCartItem
  productType: PRODUCT_TYPE
  priority?: boolean
}

export default function Tile({
  className,
  sub,
  product,
  productType,
  image,
  name,
  sizes,
  priority = false,
}: TileProps) {
  return (
    <div className={cs(style.Tile, className)}>
      <div className={style.header}>
        <Image
          src={`${process.env.NEXT_PUBLIC_DIRECTUS_URL}/assets/${typeof image === "string" ? image : image.id}`}
          alt={`Pizza ${name}`}
          width={225}
          height={125}
          priority={priority}
        />
      </div>
      <div className={style.body}>
        <div>
          <h3>{name}</h3>
          {sub && <p>{sub}</p>}
        </div>
        <div className={style.controls}>
          <TileControls product={product} productType={productType} sizes={sizes} />
        </div>
      </div>
    </div>
  )
}
