export type PickOptional<T, K extends string> = Omit<T, Extract<K, keyof T>> &
  Partial<Pick<T, Extract<K, keyof T>>>

export type OptionalKeys =
  | "id"
  | "sort"
  | "user_created"
  | "date_created"
  | "user_updated"
  | "date_updated"
