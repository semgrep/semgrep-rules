const fastify = require('fastify')()
const cors = require('@fastify/cors')
const helmet = require('@fastify/helmet')

// ruleid: fastify-cors-credentials-wildcard
fastify.register(cors, {
  origin: true,
  credentials: true,
})

// ruleid: fastify-cors-credentials-wildcard
fastify.register(cors, {
  origin: '*',
  credentials: true,
})

// ok: fastify-cors-credentials-wildcard
fastify.register(cors, {
  origin: true,
  credentials: false,
})

// ok: fastify-cors-credentials-wildcard
fastify.register(cors, {
  origin: ['https://example.com', 'https://app.example.com'],
  credentials: true,
})

// ok: fastify-cors-credentials-wildcard
fastify.register(helmet, {
  origin: true,
  credentials: true,
})
