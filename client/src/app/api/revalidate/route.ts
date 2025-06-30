import { NextRequest, NextResponse } from "next/server"
import { revalidatePath, revalidateTag } from "next/cache"

const SECRET = process.env.REVALIDATE_SECRET

if (!SECRET) throw new Error("Missing REVALIDATE_SECRET env var")

// 2 sec throttle on revalidate
const THROTTLE_MS = 2 * 1000
let lastExecutionTime = 0

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

  const now = Date.now()

  if (now - lastExecutionTime >= THROTTLE_MS) {
    lastExecutionTime = now

    try {
      console.log("Revalidate `api` tag and `/` path")
      revalidatePath("/")
      revalidateTag("api")

      return NextResponse.json({
        executed: true,
        message: "Revalidation executed immediately",
      })
    } catch (err) {
      console.error("Revalidate error", err)
      return NextResponse.json({ message: "Revalidation failed" }, { status: 500 })
    }
  } else {
    const timeUntilNext = THROTTLE_MS - (now - lastExecutionTime)
    return NextResponse.json({
      throttled: true,
      message: `Revalidation throttled. Next execution allowed in ${timeUntilNext}ms`,
    })
  }
}
