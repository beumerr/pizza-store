import path from "path"

import type { NextConfig } from "next"
import type { Compiler, Compilation } from "webpack"

const nextConfig: NextConfig = {
  webpack: (config, { isServer }) => {
    if (!isServer) {
      config.watchOptions = {
        ignored: ["**/node_modules/**"],
      }
    }

    config.plugins.push({
      apply(compiler: Compiler) {
        const extraWatchPath = path.resolve(__dirname, "../shared")

        compiler.hooks.afterCompile.tap(
          "WatchExternalFolder",
          (compilation: Compilation) => {
            compilation.contextDependencies.add(extraWatchPath)
          }
        )
      },
    })

    return config
  },
}

export default nextConfig
