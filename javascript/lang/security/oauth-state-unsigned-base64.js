const crypto = require("node:crypto");

// --- vulnerable: state from query, deserialized without verification ---

function callbackBadExpress(req) {
  // ruleid: oauth-state-unsigned-base64
  const decoded = JSON.parse(Buffer.from(req.query.state, "base64").toString("utf-8"));
  return decoded.organization_id;
}

function callbackBadExpressIndirect(req) {
  const state = req.query.state;
  // ruleid: oauth-state-unsigned-base64
  const decoded = JSON.parse(Buffer.from(state, "base64").toString("utf-8"));
  return decoded.organization_id;
}

function callbackBadNextRouteHandler(req) {
  const state = new URL(req.url).searchParams.get("state");
  // ruleid: oauth-state-unsigned-base64
  const decoded = JSON.parse(Buffer.from(state, "base64").toString());
  return decoded.organization_id;
}

function callbackBadBrowserAtob(req) {
  const state = req.query.state;
  // ruleid: oauth-state-unsigned-base64
  const decoded = JSON.parse(atob(state));
  return decoded.organization_id;
}

// --- false-positive guard: unrelated timingSafeEqual must NOT suppress ---

function callbackBadWithUnrelatedTimingSafeEqual(req, expectedApiKey) {
  const apiKey = req.headers["x-api-key"];
  if (!crypto.timingSafeEqual(Buffer.from(apiKey), Buffer.from(expectedApiKey))) {
    return null;
  }
  // ruleid: oauth-state-unsigned-base64
  const decoded = JSON.parse(Buffer.from(req.query.state, "base64").toString("utf-8"));
  return decoded.organization_id;
}

// --- false-positive guard: ordinary base64-JSON parsing of non-state input ---

function decodeConfig(configBlob) {
  // ok: oauth-state-unsigned-base64
  return JSON.parse(Buffer.from(configBlob, "base64").toString("utf-8"));
}

// --- safe: state value is HMAC-verified before deserialization ---

const SECRET = process.env.OAUTH_STATE_SECRET;

function callbackGood(req) {
  const state = req.query.state;
  const expected = crypto.createHmac("sha256", SECRET).update(state).digest();
  const provided = Buffer.from(req.query.sig, "hex");
  if (!crypto.timingSafeEqual(Buffer.from(state), expected) || !provided) {
    return null;
  }
  // ok: oauth-state-unsigned-base64
  const decoded = JSON.parse(Buffer.from(state, "base64").toString("utf-8"));
  return decoded.organization_id;
}

// --- safe: state delivered as signed JWT, verified before use ---

const jwt = require("jsonwebtoken");

function callbackGoodJwt(req) {
  const state = req.query.state;
  const payload = jwt.verify(state, SECRET);
  // ok: oauth-state-unsigned-base64
  return JSON.parse(Buffer.from(payload.body, "base64").toString("utf-8")).organization_id;
}
