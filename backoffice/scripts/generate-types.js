const { exec } = require("child_process")
const dotenv = require("dotenv")

dotenv.config()

const { NEXT_PUBLIC_DIRECTUS_URL, DIRECTUS_TOKEN } = process.env

// todo: --makeRequired=false breaks type generation on m2m fields
// @see https://github.com/StephenGunn/directus-typeforge/issues/10
// @see https://trello.com/c/EdqjUVzp/17-refactor-pickoptional-type-wait-for-resonse-on-issue
const command = `npx directus-typeforge --host ${NEXT_PUBLIC_DIRECTUS_URL} --token ${DIRECTUS_TOKEN} --outFile ../shared/util/directus-types.ts`

exec(command, (error, stdout) => {
  if (error) {
    console.error("Error generating types", error)
    process.exit(1)
  }

  console.log(stdout)
  console.log("Types generated")
})
