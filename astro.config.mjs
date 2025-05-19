// @ts-check
import { defineConfig } from "astro/config";
import node from "@astrojs/node";

// https://astro.build/config
export default defineConfig({
  output: "server",
  adapter: node({
    mode: "standalone",
  }),
  vite: {
    // Configure Vite to handle Elm files if needed
    optimizeDeps: {
      exclude: ["elm"],
    },
  },
});
