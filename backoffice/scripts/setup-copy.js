const { promises: fs } = require("fs")
const { dirname } = require("path")

async function copyDirectory(source, destination) {
  try {
    // Remove existing directory if it exists
    try {
      await fs.rm(destination, { recursive: true, force: true })
    } catch (error) {
      // Directory doesn't exist, continue
    }

    // Ensure the parent directory exists
    const destParent = dirname(destination)
    await fs.mkdir(destParent, { recursive: true })

    // Check if source exists
    try {
      await fs.access(source)
    } catch (error) {
      console.error(`Source directory does not exist: ${source}`)
      return
    }

    // Copy the directory recursively
    await fs.cp(source, destination, { recursive: true })
    console.log(`Copied: ${source} -> ${destination}`)
  } catch (error) {
    console.error(`Failed to copy directory from ${source} to ${destination}:`, error)
  }
}

// Copy shared directories
copyDirectory("./shared/util", "./extensions/order/src/shared/util")
copyDirectory("./shared/lib", "./extensions/order/src/shared/lib")
copyDirectory("./shared/cfg", "./extensions/order/src/shared/cfg")
