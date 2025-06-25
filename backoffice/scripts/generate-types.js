const { exec } = require("child_process")
const dotenv = require("dotenv")

dotenv.config()

const { DIRECTUS_URL, DIRECTUS_EMAIL, DIRECTUS_PASSWORD } = process.env

// todo: --makeRequired=false breaks type generation on m2m fields
// @see https://github.com/StephenGunn/directus-typeforge/issues/10
const command = `npx directus-typeforge --host ${DIRECTUS_URL} --email ${DIRECTUS_EMAIL} --password ${DIRECTUS_PASSWORD} --outFile ../shared/util/directus-types.ts`

exec(command, (error, stdout) => {
  if (error) {
    console.error("Error generating types", error)
    process.exit(1)
  }

  console.log(stdout)
  console.log("Types generated")
})
