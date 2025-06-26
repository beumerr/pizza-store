export function cs(...args: any[]): string {
  return args.filter((arg) => typeof arg === "string" && arg !== "").join(" ")
}

export function formatPrice(price: number): string {
  return new Intl.NumberFormat("nl-NL", {
    style: "currency",
    currency: "EUR",
    minimumFractionDigits: 2,
    maximumFractionDigits: 2,
  }).format(price)
}
