// app/api/revalidate/route.ts
import { NextRequest, NextResponse } from "next/server"
import { revalidatePath } from "next/cache"

const SECRET = process.env.REVALIDATE_SECRET
if (!SECRET) throw new Error("Missing REVALIDATE_SECRET env var")

// 10 sec debounce on revalidate
const DEBOUNCE_MS = 10 * 1000
let debounceTimer: NodeJS.Timeout | null = null

export async function POST(req: NextRequest) {
  let body: { secret?: string }

  try {
    body = await req.json()
  } catch {
    return NextResponse.json({ message: "Invalid JSON body" }, { status: 400 })
  }

  const { secret } = body

  if (secret !== SECRET) {
    return NextResponse.json({ message: "Invalid secret" }, { status: 401 })
  }

  if (debounceTimer) {
    clearTimeout(debounceTimer)
  }

  debounceTimer = setTimeout(async () => {
    try {
      console.log(`Revalidating "/"`)
      revalidatePath(`/`)
    } catch (err: any) {
      console.error(`Error revalidating "/"`, err)
    }
  }, DEBOUNCE_MS)

  return NextResponse.json({
    scheduled: true,
    message: `Revalidation will fire after ${DEBOUNCE_MS}ms debounce timer`,
  })
}
