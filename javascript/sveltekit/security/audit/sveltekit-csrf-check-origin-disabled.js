import adapter from '@sveltejs/adapter-auto';

/** @type {import('@sveltejs/kit').Config} */
const config = {
  kit: {
    adapter: adapter(),
    csrf: {
      // ruleid: sveltekit-csrf-check-origin-disabled
      checkOrigin: false,
    },
  },
};

export default config;

export const inlineConfig = {
  kit: {
    csrf: {
      // ruleid: sveltekit-csrf-check-origin-disabled
      checkOrigin: false,
    },
  },
};

export const safeConfig = {
  kit: {
    adapter: adapter(),
    csrf: {
      // ok: sveltekit-csrf-check-origin-disabled
      checkOrigin: true,
    },
  },
};

export const defaultConfig = {
  kit: {
    // ok: sveltekit-csrf-check-origin-disabled
    adapter: adapter(),
  },
};

export const unrelatedObject = {
  csrf: {
    // ok: sveltekit-csrf-check-origin-disabled
    checkOrigin: false,
  },
};
