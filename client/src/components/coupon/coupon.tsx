"use client"

import React, { useState } from "react"
import { useCartStore } from "stores/cart"
import { cs } from "shared/util/util"

import style from "./coupon.module.scss"
import Button from "../button/button"

export interface CouponProps {
  className?: string
}

export default function Coupon({ className }: CouponProps) {
  const { applyCoupon, setError, removeCoupon, coupon } = useCartStore()
  const [couponCode, setCouponCode] = useState<string>("")
  const [isProcessing, setIsProcessing] = useState<boolean>(false)

  const handleButton = async () => {
    if (!couponCode.trim()) {
      setError("Enter coupon code")
      return
    }

    setIsProcessing(true)

    try {
      await applyCoupon(couponCode)
    } catch (error) {
      console.error(error)
      setError("Can not apply coupon")
    } finally {
      setIsProcessing(false)
      setCouponCode("")
    }
  }

  const handleInput = (e: React.ChangeEvent<HTMLInputElement>) => {
    setCouponCode(e.target.value)
  }

  return (
    <div className={cs(style.Coupon, className)}>
      <div className={style.form}>
        <input
          type="text"
          placeholder="Enter coupon code"
          value={couponCode}
          onInput={handleInput}
        />
        <Button
          onClick={handleButton}
          size={"small"}
          color={"pink"}
          disabled={isProcessing}>
          Apply
        </Button>
      </div>
      {coupon && (
        <div className={style.couponInfo}>
          <div className={style.couponLabel}>
            <span className={style.couponCode}>#{coupon.code}</span>
            <span className={style.couponDiscount}>
              {Math.round(coupon.discountPercentage * 100) / 100}% off
            </span>
          </div>
          <button onClick={removeCoupon} disabled={isProcessing}>
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 79.51 82">
              <path d="m78.6,69.2l-28.2-28.2,28.2-28.2c1.2-1.2,1.2-3.1,0-4.2L70.1.1l-30.3,30.3L9.4,0,.9,8.5c-1.2,1.2-1.2,3.1,0,4.2l28.2,28.2L1,69.2c-1.2,1.2-1.2,3.1,0,4.2l8.5,8.5,30.3-30.3,30.4,30.4,8.5-8.5c1.1-1.2,1.1-3.1-.1-4.3Z" />
            </svg>
          </button>
        </div>
      )}
    </div>
  )
}
