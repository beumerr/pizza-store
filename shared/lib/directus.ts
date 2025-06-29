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

import type { ApiCollections } from "../util/directus-types"
import type { OptionalKeys, PickOptional } from "../util/types"

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

export type CollectionItemInput<T> = PickOptional<T, OptionalKeys>
export type CollectionItemUpdate<T extends DirectusKey> = UnpackList<Schema[T]>
export type CollectionQuery<T extends CollectionKey> = DirectusQuery<
  Schema,
  CollectionType<T>
>
export type ItemQuery<T extends DirectusKey> = DirectusQuery<Schema, Schema[T]>

export const createDirectusClient = (url: string, token: string): DirectusInstance => {
  if (!token) {
    throw new Error("Directus token is required")
  }
  if (!url) {
    throw new Error("Directus URL is required")
  }

  return createDirectus<Schema>(url)
    .with(staticToken(token))
    .with(
      rest({
        onRequest: (options) => ({
          ...options,
          cache: "no-store",
        }),
      })
    )
}

export const createDirectusAPI = (client: DirectusInstance) => {
  return {
    readSingleton: async <
      Key extends SingletonKey,
      Type extends SingletonItem<Key>,
      Query extends ItemQuery<Key>,
    >(
      collection: Key,
      query?: Query
    ): Promise<Type> => {
      return client.request<Type>(readSingletonSdk(collection, query))
    },

    readItem: async <
      Key extends CollectionKey,
      Type extends CollectionItem<Key>,
      Query extends CollectionQuery<Key>,
    >(
      collection: Key,
      id: DirectusItemKey,
      query?: Query
    ): Promise<Type> => {
      return client.request<Type>(readItemSdk(collection, id, query))
    },

    readItems: async <
      Key extends CollectionKey,
      Type extends CollectionItem<Key>,
      Query extends CollectionQuery<Key>,
    >(
      collection: Key,
      query?: Query
    ): Promise<Type> => {
      return client.request<Type>(readItemsSdk(collection, query))
    },

    createItem: async <
      Key extends CollectionKey,
      Type extends CollectionType<Key>,
      Item extends CollectionItemInput<Type>,
      Query extends ItemQuery<Key>,
    >(
      collection: Key,
      item: Item,
      query?: Query
    ): Promise<Type> => {
      return client.request<Type>(
        createItemSdk(collection, item as CollectionType<Key>, query)
      )
    },

    createItems: async <
      Key extends CollectionKey,
      Type extends CollectionType<Key>,
      Item extends CollectionItemInput<Type>,
      Query extends ItemQuery<Key>,
    >(
      collection: Key,
      items: Item[],
      query?: Query
    ): Promise<Type[]> => {
      return client.request<Type[]>(
        createItemsSdk(collection, items as CollectionType<Key>[], query)
      )
    },

    updateSingleton: async <
      Key extends SingletonKey,
      Type extends CollectionType<Key>,
      Item extends CollectionItemInput<Type>,
      Query extends ItemQuery<Key>,
    >(
      collection: Key,
      item: Item,
      query?: Query
    ): Promise<Type> => {
      return client.request<Type>(
        updateSingletonSdk(collection, item as Partial<Item>, query)
      )
    },

    updateItem: async <
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
      return client.request<Type>(
        updateItemSdk(collection, key, item as Partial<Item>, query)
      )
    },

    updateItems: async <
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
      return client.request<Type[]>(updateItemsSdk(collection, keys, item, query))
    },

    deleteItem: async <Key extends CollectionKey>(
      collection: Key,
      key: DirectusItemKey
    ): Promise<void> => {
      return client.request(deleteItemSdk(collection, key))
    },

    deleteItems: async <Key extends CollectionKey>(
      collection: Key,
      keys: DirectusItemKeys
    ): Promise<void> => {
      return client.request(deleteItemsSdk(collection, keys))
    },
  }
}
