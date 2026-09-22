import { defineConfig, loadEnv } from 'vite';  

export default defineConfig(({ mode }) => {
  return {
    define: {
    // ruleid: vitejs-process-env-direct-use
    "process.env": process.env
    }
  }
});


const goodConfig = defineConfig(({ mode }) => {
  return {
    define: {
    // ok: vitejs-process-env-direct-use
    "process.env": {}
    }
  };
});
