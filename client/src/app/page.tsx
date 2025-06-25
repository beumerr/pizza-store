import { getShowcases } from "actions/actions"

export default async function Home() {
  // example - delete this
  const { data, error } = await getShowcases()

  if (error) {
    throw new Error(`Failed to fetch showcases: ${error}`)
  }

  return <>example</>
}
