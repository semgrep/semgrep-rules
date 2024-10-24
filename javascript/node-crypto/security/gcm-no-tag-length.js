const crypto = require('node:crypto')
function decrypt1(ciphertext, key) {
    iv = ciphertext.iv
    encryptedData = ciphertext.data
    auth = ciphertext.auth

    algo = "aes-128-gcm"

    // ruleid: gcm-no-tag-length
    const decipher = crypto.createDecipheriv(algo, key, iv);
    decipher.setAuthTag(auth);
    let result = decipher.update(encryptedData) + decipher.final();

    return result.toString("utf8");
}

function decrypt2(ciphertext, key) {
    iv = ciphertext.iv
    encryptedData = ciphertext.data
    auth = ciphertext.auth
    // While this prevents the attack, I'm not quite sure how to capture such length checks and exclude them from the findings
    assert(auth.length === 16)

    // ruleid: gcm-no-tag-length
    const decipher = crypto.createDecipheriv("aes-192-gcm", key, iv);
    decipher.setAuthTag(auth);
    let result = decipher.update(encryptedData) + decipher.final();

    return result.toString("utf8");
}

function decrypt3(ciphertext, key) {
    iv = ciphertext.iv
    encryptedData = ciphertext.data
    auth = ciphertext.auth

    // ok: gcm-no-tag-length
    var decipher = crypto.createDecipheriv("aes-128-gcm", key, iv, {authTagLength: 16});
    decipher.setAuthTag(auth);
    let result = Buffer.concat([decipher.update(encryptedData), decipher.final()]);

    return result;
}

function decrypt4(ciphertext, key) {
    iv = ciphertext.iv
    encryptedData = ciphertext.data
    auth = ciphertext.auth

    // even though auth tag is shorter than it should be, this looks like a conscious choice
    // ok: gcm-no-tag-length
    var decipher = crypto.createDecipheriv("aes-256-gcm", key, iv, {authTagLength: 4});
    decipher.setAuthTag(auth);
    let result = Buffer.concat([decipher.update(encryptedData), decipher.final()]);

    return result;
}

function decrypt5(ciphertext, key) {
    iv = ciphertext.iv
    encryptedData = ciphertext.data
    auth = ciphertext.auth

    // hard to capture whether options contain 'authTagLength', so to reduce false positives, just ignore any call with options
    // ok: gcm-no-tag-length
    var decipher = crypto.createDecipheriv("aes-256-gcm", key, iv, {someOption: someValue})
    decipher.setAuthTag(auth)
    let result = decipher.update(encryptedData)+ decipher.final()

    return result;
}

function decrypt6(ciphertext, key) {
    iv = ciphertext.iv
    encryptedData = ciphertext.data
    auth = ciphertext.auth

    // ok: gcm-no-tag-length
    var decipher = crypto.createDecipheriv("chacha20-poly1305", key, iv)
    decipher.setAuthTag(auth)
    let result = decipher.update(encryptedData)+ decipher.final()

    return result;
}
