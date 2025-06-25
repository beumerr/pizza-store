import type { Metadata } from "next"

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
      <body>{children}</body>
    </html>
  )
}
