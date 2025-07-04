import localFont from "next/font/local"
import { cs } from "util/util"
import type { Metadata } from "next"

import "../../shared/styles/global.scss"

const mont = localFont({
  variable: "--mont",
  display: "swap",
  src: [
    {
      path: "../../shared/fonts/mont/mont-bold.woff2",
      weight: "600",
      style: "normal",
    },
    {
      path: "../../shared/fonts/mont/mont-heavy.woff2",
      weight: "900",
      style: "bold",
    },
  ],
})

const magicBubble = localFont({
  variable: "--magic-bubble",
  display: "swap",
  src: [
    {
      path: "../../shared/fonts/magic-bubble/magic-bubble.woff2",
      weight: "600",
      style: "normal",
    },
  ],
})

export const metadata: Metadata = {
  title: "Pizza Cacao",
  description: "A pizza shop with Directus backend and Next.js frontend.",
}

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode
}>) {
  return (
    <html lang="en">
      <head>
        <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png" />
        <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png" />
        <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png" />
        <link rel="manifest" href="/site.webmanifest" />
      </head>
      <body className={cs(mont.variable, magicBubble.variable)}>{children}</body>
    </html>
  )
}
