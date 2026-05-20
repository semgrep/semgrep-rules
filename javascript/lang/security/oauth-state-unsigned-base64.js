const crypto = require("node:crypto");

// --- vulnerable ---

function callbackBad(req) {
  const state = req.query.state;
  // ruleid: oauth-state-unsigned-base64
  const decoded = JSON.parse(Buffer.from(state, "base64").toString("utf-8"));
  return decoded.organization_id;
}

function callbackBadBrowser(req) {
  const state = req.query.state;
  // ruleid: oauth-state-unsigned-base64
  const decoded = JSON.parse(atob(state));
  return decoded.organization_id;
}

// --- safe: HMAC-verified before deserialization ---

const SECRET = process.env.OAUTH_STATE_SECRET;

function callbackGood(req) {
  const raw = req.query.state;
  const [body, sig] = raw.split(".");
  const expected = crypto.createHmac("sha256", SECRET).update(body).digest("hex");
  if (!crypto.timingSafeEqual(Buffer.from(sig), Buffer.from(expected))) {
    return null;
  }
  // ok: oauth-state-unsigned-base64
  const decoded = JSON.parse(Buffer.from(body, "base64").toString("utf-8"));
  return decoded.organization_id;
}
