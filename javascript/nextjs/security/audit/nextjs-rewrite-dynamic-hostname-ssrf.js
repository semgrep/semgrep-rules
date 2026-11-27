/** @type {import('next').NextConfig} */
module.exports = {
  async rewrites() {
    return [
      // ruleid: nextjs-rewrite-dynamic-hostname-ssrf
      {
        source: '/:tenant',
        destination: 'https://:tenant.api.example.com',
      },
      // ruleid: nextjs-rewrite-dynamic-hostname-ssrf
      {
        source: '/',
        has: [{ type: 'query', key: 'region', value: '(?<region>.+)' }],
        destination: 'https://:region.api.example.com',
      },
      // ok: nextjs-rewrite-dynamic-hostname-ssrf
      {
        source: '/blog/:slug*',
        destination: 'https://cms.example.com/posts/:slug*',
      },
      // ok: nextjs-rewrite-dynamic-hostname-ssrf
      {
        source: '/api/:path*',
        destination: '/internal-api/:path*',
      },
      // ok: nextjs-rewrite-dynamic-hostname-ssrf
      {
        source: '/legacy',
        destination: 'https://api.example.com/legacy',
      },
    ]
  },
  redirects: async () => {
    return [
      // ruleid: nextjs-rewrite-dynamic-hostname-ssrf
      {
        source: '/:tenant/old',
        destination: 'https://:tenant.api.example.com/new',
        permanent: true,
      },
      // ok: nextjs-rewrite-dynamic-hostname-ssrf
      {
        source: '/old-docs',
        destination: 'https://docs.example.com/new-docs',
        permanent: true,
      },
    ]
  },
}
