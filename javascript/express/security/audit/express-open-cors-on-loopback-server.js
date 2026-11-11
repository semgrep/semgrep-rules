const express = require("express");
const cors = require("cors");

function defaultCors() {
  const app = express();
  // ruleid: express-open-cors-on-loopback-server
  app.use(cors());
  app.use(express.json());
  app.get("/memory", (req, res) => res.json({ facts: [] }));
  app.listen(7700, "127.0.0.1");
}

function reflectedOrigin() {
  const app = express();
  // ruleid: express-open-cors-on-loopback-server
  app.use(cors({ origin: true, credentials: true }));
  const server = app.listen(7701, "localhost", () => {});
}

function wildcardOrigin() {
  const app = express();
  // ruleid: express-open-cors-on-loopback-server
  app.use(cors({ origin: "*" }));
  app.listen(7702, "::1");
}

function listedOrigins() {
  const app = express();
  // ok: express-open-cors-on-loopback-server
  app.use(cors({ origin: ["http://127.0.0.1:5173"] }));
  app.listen(7703, "127.0.0.1");
}

function publicServer() {
  // Not a loopback server. Whether open CORS is fine here depends on the API.
  const app = express();
  // ok: express-open-cors-on-loopback-server
  app.use(cors());
  app.listen(8080, "0.0.0.0");
}
