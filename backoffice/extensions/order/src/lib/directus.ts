import dotenv from "dotenv"
import { createDirectusClient, createDirectusAPI } from "../shared/lib/directus"

dotenv.config()

const DIRECTUS_URL = process.env.NEXT_PUBLIC_DIRECTUS_URL
const DIRECTUS_TOKEN = process.env.DIRECTUS_TOKEN

if (!DIRECTUS_URL) {
  throw new Error("DIRECTUS_URL environment variable is not set")
}

if (!DIRECTUS_TOKEN) {
  throw new Error("DIRECTUS_TOKEN environment variable is not set")
}

const client = createDirectusClient(DIRECTUS_URL, DIRECTUS_TOKEN)
const directus = createDirectusAPI(client)

export const {
  readSingleton,
  readItem,
  readItems,
  createItem,
  createItems,
  updateSingleton,
  updateItem,
  updateItems,
  deleteItem,
  deleteItems,
} = directus

export default directus
