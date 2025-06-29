import { create } from "zustand"

export type ToastType = "info" | "success" | "error" | "warning"

export interface Toast {
  id: number
  type: ToastType
  text: string
}

interface ToastState {
  toasts: Toast[]
  removingToasts: Set<number>
}

interface ToastActions {
  addToast: (toast: Omit<Toast, "id">) => number
  setRemoving: (id: number) => void
  finishRemove: (id: number) => void
  getActiveToasts: () => Toast[]
}

const TOAST_TIMER = 10000 // 10 seconds
let idCounter = 0
let removeToastCallback: ((id: number) => void) | null = null

// Function to register the remove callback from ToastProvider
export const setRemoveToastCallback = (callback: (id: number) => void) => {
  removeToastCallback = callback
}

export const useToastStore = create<ToastState & ToastActions>((set, get) => ({
  toasts: [],
  removingToasts: new Set(),

  addToast: (toast: Omit<Toast, "id">) => {
    const id = idCounter++
    const newToast: Toast = { id, ...toast }

    set((state) => ({
      toasts: [...state.toasts, newToast],
    }))

    // Auto-remove after timer - call the same remove function as manual clicks
    setTimeout(() => {
      if (removeToastCallback) {
        removeToastCallback(id)
      }
    }, TOAST_TIMER)

    return id
  },

  setRemoving: (id: number) => {
    set((state) => ({
      removingToasts: new Set([...state.removingToasts, id]),
    }))
  },

  finishRemove: (id: number) => {
    set((state) => ({
      toasts: state.toasts.filter((t) => t.id !== id),
      removingToasts: new Set(
        [...state.removingToasts].filter((removeId) => removeId !== id)
      ),
    }))
  },

  getActiveToasts: () => {
    const { toasts, removingToasts } = get()
    return toasts.filter((toast) => !removingToasts.has(toast.id))
  },
}))

// Export a simple function that can be called from anywhere
export const addToast = (toast: Omit<Toast, "id">): number => {
  return useToastStore.getState().addToast(toast)
}
