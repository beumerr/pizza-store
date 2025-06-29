"use client"

import React, {
  useEffect,
  useState,
  createContext,
  useContext,
  Children,
  useCallback,
} from "react"
import useEmblaCarousel from "embla-carousel-react"
import AutoHeight from "embla-carousel-auto-height"

import { cs } from "util/util"

import type { EmblaOptionsType, EmblaCarouselType } from "embla-carousel"

import style from "./embla.module.scss"

export interface EmblaContext {
  emblaApi: EmblaCarouselType | undefined
  emblaRef: (node: HTMLDivElement) => void
  selectedIndex: number
  scrollNext: () => void
  scrollPrev: () => void
  scrollTo: (index: number) => void
}

const EmblaContext = createContext<EmblaContext | null>(null)

export const useEmbla = () => {
  const context = useContext(EmblaContext)
  if (!context) {
    throw new Error("useEmbla must be used within an EmblaProvider")
  }
  return context
}

export interface EmblaProviderProps {
  children: React.ReactNode
  options?: EmblaOptionsType
}

export function EmblaProvider({
  children,
  options = { loop: false, watchDrag: true },
}: EmblaProviderProps) {
  const [selectedIndex, setSelectedIndex] = useState(0)

  const plugins = [AutoHeight()]

  const [emblaRef, emblaApi] = useEmblaCarousel(options, plugins)

  const scrollNext = () => {
    if (emblaApi?.canScrollNext()) {
      emblaApi.scrollNext()
      return
    }

    emblaApi?.scrollPrev()
  }

  const scrollPrev = () => {
    if (emblaApi?.canScrollPrev()) {
      emblaApi.scrollPrev()
      return
    }

    emblaApi?.scrollNext()
  }

  const scrollTo = (index: number) => {
    if (emblaApi) emblaApi.scrollTo(index)
  }

  const onSelect = useCallback((emblaApi: EmblaCarouselType) => {
    setSelectedIndex(emblaApi.selectedScrollSnap())
  }, [])

  useEffect(() => {
    if (!emblaApi) return

    onSelect(emblaApi)
    emblaApi.on("reInit", onSelect).on("select", onSelect)

    return () => {
      emblaApi.off("reInit", onSelect).off("select", onSelect)
    }
  }, [emblaApi, onSelect])

  const contextValue: EmblaContext = {
    emblaApi,
    emblaRef,
    selectedIndex,
    scrollNext,
    scrollPrev,
    scrollTo,
  }

  return <EmblaContext.Provider value={contextValue}>{children}</EmblaContext.Provider>
}

export interface EmblaSliderProps {
  children: React.ReactNode
  className?: string
  slideClassName?: string
}

export function EmblaSlider({ children, className, slideClassName }: EmblaSliderProps) {
  const { emblaRef, selectedIndex } = useEmbla()

  const slides = Children.toArray(children)

  return (
    <div className={cs(style.EmblaSlider, className)}>
      <div className={style.viewport} ref={emblaRef}>
        <div className={style.container}>
          {slides.map((slide, i) => (
            <div
              className={cs(style.slide, slideClassName, selectedIndex === i && "active")}
              key={`slide-${i}`}>
              {slide}
            </div>
          ))}
        </div>
      </div>
    </div>
  )
}
