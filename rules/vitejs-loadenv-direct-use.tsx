import { defineConfig, loadEnv } from 'vite';  

export default defineConfig(({ mode }) => {
  // ruleid: vitejs-loadenv-direct-use
  const env = loadEnv(mode, process.cwd(), '');

  return {
    define: {
    "process.env": env
    }
  }
});

// testing variations in quote and variable propagation
const altConfig = defineConfig(({ mode }) => {
  // ruleid: vitejs-loadenv-direct-use
  const env = loadEnv(mode, process.cwd(), "");
  let xyz = env;
  var abc = xyz;

  return {
    define: {
    'process.env': abc
    }
  }
});


const goodConfig = defineConfig(({ mode }) => {
  // ok: vitejs-loadenv-direct-use
  const safe = loadEnv(mode, process.cwd(), "APP_");

  return {
    define: {
    'process.env': safe
    }
  }
});

/* for taint scenarios, use the vitejs-loadenv-direct-use-tainted.yaml file */
const taintConfig = defineConfig(({ mode }) => {
  // const env = loadEnv(mode, process.cwd(), "");
  const env = {};

  return {
    define: {
      // Provide an explicit app-level constant derived from an env var.
      __APP_ENV__: JSON.stringify(env.APP_ENV),
    },
    // Example: use an env var to set the dev server port conditionally.
    server: {
      port: env.APP_PORT ? Number(env.APP_PORT) : 5173,
    },
  }
});