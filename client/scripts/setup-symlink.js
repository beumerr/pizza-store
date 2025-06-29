const { promises: fs } = require("fs")
const { dirname, resolve } = require("path")

async function createSymLink(target, path) {
  try {
    // Check if the link already exists
    try {
      const stats = await fs.lstat(path)
      if (stats.isSymbolicLink()) {
        return
      } else {
        await fs.rm(path, { recursive: true, force: true })
      }
    } catch (error) {
      // Path doesn't exist so continue
    }

    // Ensure the parent directory exists
    const linkParent = dirname(path)
    await fs.mkdir(linkParent, { recursive: true })

    // Create the symlink
    const targetPath = resolve(target)
    await fs.symlink(targetPath, path, "junction")
    console.log(`Created symlink: ${target} -> ${path}`)
  } catch (error) {
    console.error("Failed to create symLink", error)
  }
}

createSymLink("../shared/fonts", "./shared/fonts", "junction")
createSymLink("../shared/styles", "./shared/styles", "junction")
createSymLink("../shared/util", "./shared/util", "junction")
createSymLink("../shared/lib", "./shared/lib", "junction")
createSymLink("../shared/cfg", "./shared/cfg", "junction")
createSymLink("../shared/tests", "./shared/tests", "junction")

createSymLink("../shared/assets", "./public/assets", "junction")
