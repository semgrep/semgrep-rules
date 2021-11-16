const crypto = require("crypto");

function ex1(user, pwtext) {
    digest = crypto.createHash("md5").update(pwtext).digest("hex");
    // ruleid: md5-used-as-password
    user.setPassword(digest);
}

function ok1(user, pwtext) {
    digest = crypto.createHash("sha256").update(pwtext).digest("hex");
    // ok: md5-used-as-password
    user.setPassword(digest);
}
