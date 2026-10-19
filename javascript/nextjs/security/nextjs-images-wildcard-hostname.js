// Test cases for nextjs-images-wildcard-hostname rule

// BAD: Using wildcard hostname - should trigger the rule
const badConfig1 = {
  images: {
    remotePatterns: [
      {
        protocol: 'https',
        hostname: '**', // ERROR: Wildcard hostname
        port: '',
        pathname: '/account123/**',
      },
    ],
  },
};

// BAD: Another wildcard hostname pattern - should trigger the rule
const badConfig2 = {
  images: {
    remotePatterns: [
      {
        hostname: '**', // ERROR: Wildcard hostname
      },
    ],
  },
};

// BAD: Wildcard in nested structure - should trigger the rule
const badConfig3 = {
  images: {
    remotePatterns: [
      {
        protocol: 'https',
        hostname: '**', // ERROR: Wildcard hostname
        port: '8080',
        pathname: '/images/**',
      },
    ],
  },
};

// GOOD: Specific domain - should not trigger the rule
const goodConfig1 = {
  images: {
    remotePatterns: [
      {
        protocol: 'https',
        hostname: 'example.com', // OK: Specific domain
        port: '',
        pathname: '/account123/**',
      },
    ],
  },
};

// GOOD: Multiple specific domains - should not trigger the rule
const goodConfig2 = {
  images: {
    remotePatterns: [
      {
        protocol: 'https',
        hostname: 'cdn.example.com', // OK: Specific subdomain
        port: '',
        pathname: '/images/**',
      },
      {
        protocol: 'https',
        hostname: 'assets.example.com', // OK: Another specific subdomain
        port: '',
        pathname: '/public/**',
      },
    ],
  },
};

// GOOD: Using subdomain wildcard (more restrictive) - should not trigger the rule
const goodConfig3 = {
  images: {
    remotePatterns: [
      {
        protocol: 'https',
        hostname: '*.example.com', // OK: Subdomain wildcard (more restrictive)
        port: '',
        pathname: '/images/**',
      },
    ],
  },
};

// GOOD: Localhost and specific IP - should not trigger the rule
const goodConfig4 = {
  images: {
    remotePatterns: [
      {
        protocol: 'http',
        hostname: 'localhost', // OK: Localhost
        port: '3000',
        pathname: '/uploads/**',
      },
      {
        protocol: 'https',
        hostname: '192.168.1.100', // OK: Specific IP
        port: '',
        pathname: '/media/**',
      },
    ],
  },
};

// GOOD: Empty remotePatterns - should not trigger the rule
const goodConfig5 = {
  images: {
    remotePatterns: [], // OK: Empty array
  },
};

// GOOD: No images config - should not trigger the rule
const goodConfig6 = {
  // No images configuration
  experimental: {
    appDir: true,
  },
};

// GOOD: Images config without remotePatterns - should not trigger the rule
const goodConfig7 = {
  images: {
    domains: ['example.com'], // OK: Using domains instead of remotePatterns
  },
};
