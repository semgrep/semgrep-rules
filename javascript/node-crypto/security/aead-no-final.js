const crypto = require('node:crypto')
function decrypt1(ciphertext, key) {
    iv = ciphertext.iv
    encryptedData = ciphertext.data

    // ruleid: aead-no-final
    const decipher = crypto.createDecipheriv("aes-128-gcm", key, iv);
    let result = decipher.update(encryptedData);

    return result.toString("utf8");
}

algo = "aes-192-gcm"
function decrypt2(ciphertext, key) {
    iv = ciphertext.iv
    encryptedData = ciphertext.data
    auth = ciphertext.auth

    // ruleid: aead-no-final
    var decipher = crypto.createDecipheriv(algo, key, iv);
    decipher.setAuthTag(auth);
    let result = decipher.update(encryptedData);

    return result.toString("utf8");
}

function decrypt3(ciphertext, key) {
    iv = ciphertext.iv
    encryptedData = ciphertext.data
    auth = ciphertext.auth

    // ruleid: aead-no-final
    const decipher = crypto.createDecipheriv("aes-256-ccm", key, iv, {authTagLength: 16})
    decipher.setAuthTag(auth)
    decipher.setAAD(Buffer.alloc(0), {plaintextLength: encryptedData.length})
    let result = decipher.update(encryptedData)

    return result;
}

function decrypt4(key, ciphertext) {
    let encrypted = Buffer.from(ciphertext, 'base64');
    let iv = encrypted.slice(encrypted.byteLength - 12, encrypted.byteLength);

    // ruleid: aead-no-final
    let decipher = crypto.createDecipheriv("aes-256-ocb", key, iv, {authTagLength: 16});
    let decrypted = decipher.update(encrypted.slice(0, encrypted.byteLength - 16 - 12));

    decrypted = Buffer.concat([decrypted]);
    return decrypted;
}

const { createDecipheriv } = require('node:crypto')
function decrypt5(key, ciphertext) {
    let iv = ciphertext.slice(ciphertext.byteLength - 12, ciphertext.byteLength);

    // ruleid: aead-no-final
    let decipher = createDecipheriv("chacha20-poly1305", key, iv);
    let decrypted = decipher.update(ciphertext.slice(0, ciphertext.byteLength - 16 - 12));

    decrypted = Buffer.concat([decrypted]);
    return decrypted;
}

function decrypt6(ciphertext, key) {
    iv = ciphertext.iv
    encryptedData = ciphertext.data
    auth = ciphertext.auth

    // ok: aead-no-final
    var decipher = crypto.createDecipheriv("aes-128-gcm", key, iv);
    decipher.setAuthTag(auth);
    let result = Buffer.concat([decipher.update(encryptedData), decipher.final()]);

    return result;
}

function decrypt7(ciphertext, key) {
    iv = ciphertext.iv
    encryptedData = ciphertext.data
    auth = ciphertext.auth

    // ok: aead-no-final
    var decipher = crypto.createDecipheriv("aes-192-ccm", key, iv, {authTagLength: 16})
    decipher.setAuthTag(auth)
    let result = decipher.update(encryptedData)
    result += decipher.final()

    return result
}

function decrypt8(ciphertext, key) {
    iv = ciphertext.iv
    encryptedData = ciphertext.data
    auth = ciphertext.auth

    // ok: aead-no-final
    var decipher = crypto.createDecipheriv("aes-256-ocb", key, iv, {authTagLength: 16});
    decipher.setAuthTag(auth);
    return decipher.update(encryptedData) + decipher.final();
}

function decrypt9(ciphertext, key) {
    iv = ciphertext.iv
    encryptedData = ciphertext.data
    auth = ciphertext.auth

    // missing final, but not AEAD mode
    // ok: aead-no-final
    var decipher = crypto.createDecipheriv("aes-192-cbc", key, iv);
    let result = decipher.update(encryptedData);

    return result.toString("utf8");
}
