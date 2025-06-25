import {
  createDirectus,
  staticToken,
  createItem as createItemSdk,
  createItems as createItemsSdk,
  updateItem as updateItemSdk,
  updateItems as updateItemsSdk,
  deleteItem as deleteItemSdk,
  deleteItems as deleteItemsSdk,
  readItem as readItemSdk,
  readItems as readItemsSdk,
  readSingleton as readSingletonSdk,
  updateSingleton as updateSingletonSdk,
  rest,
  DirectusClient,
  RestClient,
  StaticTokenClient,
  Query as DirectusQuery,
  CollectionType as DirectusCollectionType,
  UnpackList,
  SingletonCollections,
  RegularCollections,
} from "@directus/sdk"

import type { ApiCollections } from "../../../shared/util/directus-types"
import type { PickOptional } from "../../../shared/util/types"

export type Schema = ApiCollections

export type SingletonKey = SingletonCollections<Schema>

export type CollectionKey = RegularCollections<Schema>

export type DirectusKey = SingletonKey | CollectionKey

export type DirectusItemKeys = string[] | number[]

export type DirectusItemKey = string | number

export type SingletonItem<T extends SingletonKey> = Schema[T]

export type CollectionItem<T extends CollectionKey> = Schema[T]

export type CollectionType<T> = DirectusCollectionType<Schema, T>

export type DirectusInstance = DirectusClient<Schema> &
  StaticTokenClient<Schema> &
  RestClient<Schema>

export type DirectusOptionalKeys =
  | "id"
  | "sort"
  | "user_created"
  | "date_created"
  | "user_updated"
  | "date_updated"

export type CollectionItemInput<T> = PickOptional<T, DirectusOptionalKeys>

export type CollectionItemUpdate<T extends DirectusKey> = UnpackList<Schema[T]>

export type CollectionQuery<T extends CollectionKey> = DirectusQuery<
  Schema,
  CollectionType<T>
>

export type ItemQuery<T extends DirectusKey> = DirectusQuery<Schema, Schema[T]>

interface DirectusState {
  client: DirectusInstance | null
}

const state: DirectusState = {
  client: null,
}

const createClient = () => {
  const token = process.env.DIRECTUS_TOKEN
  const url = process.env.DIRECTUS_URL

  if (!token) {
    throw new Error("DIRECTUS_TOKEN environment variable is not set")
  }

  if (!url) {
    throw new Error("DIRECTUS_URL environment variable is not set")
  }

  state.client = createDirectus<Schema>(url)
    .with(staticToken(token))
    .with(
      rest({
        onRequest: (options) => ({
          ...options,
          cache: "no-store", // Prevent Next.js caching issues
        }),
      })
    )

  return state.client
}

const getClient = () => {
  return state.client ?? createClient()
}

export const readSingleton = async <
  Key extends SingletonKey,
  Type extends SingletonItem<Key>,
  Query extends ItemQuery<Key>,
>(
  collection: Key,
  query?: Query
): Promise<Type> => {
  const client = getClient()
  return client.request<Type>(readSingletonSdk(collection, query))
}

export const readItem = async <
  Key extends CollectionKey,
  Type extends CollectionItem<Key>,
  Query extends CollectionQuery<Key>,
>(
  collection: Key,
  id: DirectusItemKey,
  query?: Query
): Promise<Type> => {
  const client = getClient()
  return client.request<Type>(readItemSdk(collection, id, query))
}

export const readItems = async <
  Key extends CollectionKey,
  Type extends CollectionItem<Key>,
  Query extends CollectionQuery<Key>,
>(
  collection: Key,
  query?: Query
): Promise<Type> => {
  const client = getClient()
  return client.request<Type>(readItemsSdk(collection, query))
}

export const createItem = async <
  Key extends CollectionKey,
  Type extends CollectionType<Key>,
  Item extends CollectionItemInput<Type>,
  Query extends ItemQuery<Key>,
>(
  collection: Key,
  item: Item,
  query?: Query
): Promise<Type> => {
  const client = getClient()
  return client.request<Type>(
    createItemSdk(collection, item as CollectionType<Key>, query)
  )
}

export const createItems = async <
  Key extends CollectionKey,
  Type extends CollectionType<Key>,
  Item extends CollectionItemInput<Type>,
  Query extends ItemQuery<Key>,
>(
  collection: Key,
  items: Item[],
  query?: Query
): Promise<Type[]> => {
  const client = getClient()
  return client.request<Type[]>(
    createItemsSdk(collection, items as CollectionType<Key>[], query)
  )
}

export const updateSingleton = async <
  Key extends SingletonKey,
  Type extends CollectionType<Key>,
  Item extends CollectionItemInput<Type>,
  Query extends ItemQuery<Key>,
>(
  collection: Key,
  item: Item,
  query?: Query
): Promise<Type> => {
  const client = getClient()
  return client.request<Type>(
    updateSingletonSdk(collection, item as Partial<Item>, query)
  )
}

export const updateItem = async <
  Key extends DirectusKey,
  Type extends CollectionType<Key>,
  Item extends CollectionItemUpdate<Key>,
  Query extends ItemQuery<Key>,
>(
  collection: Key,
  key: DirectusItemKey,
  item: Item,
  query?: Query
): Promise<Type> => {
  const client = getClient()
  return client.request<Type>(
    updateItemSdk(collection, key, item as Partial<Item>, query)
  )
}

export const updateItems = async <
  Key extends CollectionKey,
  Type extends CollectionType<Key>,
  Item extends CollectionItemUpdate<Key>,
  Query extends ItemQuery<Key>,
>(
  collection: Key,
  keys: DirectusItemKeys,
  item: Item,
  query?: Query
): Promise<Type[]> => {
  const client = getClient()
  return client.request<Type[]>(updateItemsSdk(collection, keys, item, query))
}

export const deleteItem = async <Key extends CollectionKey>(
  collection: Key,
  key: DirectusItemKey
): Promise<void> => {
  const client = getClient()
  return client.request(deleteItemSdk(collection, key))
}

export const deleteItems = async <Key extends CollectionKey>(
  collection: Key,
  keys: DirectusItemKeys
): Promise<void> => {
  const client = getClient()
  return client.request(deleteItemsSdk(collection, keys))
}

export default {
  getClient,
  readItem,
  readItems,
  readSingleton,
  createItem,
  createItems,
  updateItem,
  updateItems,
  updateSingleton,
  deleteItem,
  deleteItems,
}
