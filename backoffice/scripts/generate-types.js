import { exec } from "child_process"
import dotenv from "dotenv"

dotenv.config()

const { DIRECTUS_URL, DIRECTUS_EMAIL, DIRECTUS_PASSWORD } = process.env

const command = `npx directus-typeforge --host ${DIRECTUS_URL} --email ${DIRECTUS_EMAIL} --password ${DIRECTUS_PASSWORD} -o ../shared/util/directus-types.ts`

exec(command, (error, stdout) => {
  if (error) {
    console.error("Error generating types", error)
    process.exit(1)
  }

  console.log(stdout)
  console.log("Types generated")
})
