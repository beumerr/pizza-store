import path from "path"

import type { NextConfig } from "next"
import type { Compiler, Compilation } from "webpack"

const nextConfig: NextConfig = {
  images: {
    domains: ["127.0.0.1"],
  },
  webpack: (config, { isServer }) => {
    if (!isServer) {
      config.watchOptions = {
        ignored: ["**/node_modules/**"],
      }
    }

    config.module.rules.push({
      test: /\.(js|jsx|ts|tsx)$/,
      include: [require("path").resolve(__dirname, "shared")],
    })

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
