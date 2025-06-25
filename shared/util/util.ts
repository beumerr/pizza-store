export function cs(...args: any[]): string {
  return args.filter((arg) => typeof arg === "string" && arg !== "").join(" ")
}
