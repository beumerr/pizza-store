import { defineConfig } from "vitest/config"

export default defineConfig({
  test: {
    environment: "jsdom",
    include: ["**/*.{test,spec}.{js,mjs,cjs,ts,mts,cts,jsx,tsx}"],
    coverage: {
      provider: "v8",
      reporter: ["text", "json", "html"],
      include: [
        "shared/lib/**/*.{js,ts}",
        "shared/cfg/**/*.{js,ts}",
        "shared/util/**/*.{js,ts}",
      ],
      exclude: [
        "node_modules/",
        "**/*.d.ts",
        "**/*.config.{js,ts}",
        "**/*.test.{js,ts}",
        "**/*.spec.{js,ts}",
      ],
      thresholds: {
        global: {
          branches: 80,
          functions: 80,
          lines: 80,
          statements: 80,
        },
      },
    },
    globals: true,
    testTimeout: 10000,
    hookTimeout: 10000,
  },
})
