export type NonArrayKeys<T> = {
  [K in keyof T]: T[K] extends Array<any> ? never : K
}[keyof T]

export type ArrayKeys<T> = {
  [K in keyof T]: T[K] extends Array<any> ? K : never
}[keyof T]

export type PickOptional<T, K extends string> = Omit<T, Extract<K, keyof T>> &
  Partial<Pick<T, Extract<K, keyof T>>>
