"use client"

import { useState, useCallback } from "react"
import { getShowcases } from "actions/actions"

import type { ActionResult } from "actions/actions"
import type { Showcase } from "util/directus-types"

type ServerAction<T = any, Args extends any[] = any[]> = (
  ...args: Args
) => Promise<ActionResult<T>>

interface UseServerAction<T> {
  data: T | null
  loading: boolean
  error: string | null
  execute: (...args: any[]) => Promise<ActionResult<T>>
  reset: () => void
}

export function useServerAction<T, Args extends any[] = any[]>(
  serverAction: ServerAction<T, Args>
): UseServerAction<T> {
  const [data, setData] = useState<T | null>(null)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const execute = useCallback(
    async (...args: Args): Promise<ActionResult<T>> => {
      setLoading(true)
      setError(null)

      try {
        const result = await serverAction(...args)

        if (result.success) {
          setData(result.data ?? null)
          setError(null)
          return result
        } else {
          setError(result.error || "An error occurred")
          setData(null)
          return result
        }
      } catch (err) {
        const errorMessage =
          err instanceof Error ? err.message : "An unexpected error occurred"
        setError(errorMessage)
        setData(null)
        return { success: false, error: errorMessage }
      } finally {
        setLoading(false)
      }
    },
    [serverAction]
  )

  const reset = useCallback(() => {
    setData(null)
    setError(null)
    setLoading(false)
  }, [])

  return {
    data,
    loading,
    error,
    execute,
    reset,
  }
}

export function useShowcases() {
  return useServerAction<Showcase[]>(getShowcases)
}
