const crypto = require('node:crypto')
function decrypt1(ciphertext, key) {
    iv = ciphertext.iv
    encryptedData = ciphertext.data

    // ruleid: create-de-cipher-no-iv
    const decipher = crypto.createDecipher("aes-128-gcm", key, iv);
    let result = decipher.update(encryptedData);

    return result.toString("utf8");
}

function decrypt2(ciphertext, key) {
    encryptedData = ciphertext.data
    auth = ciphertext.auth

    // ruleid: create-de-cipher-no-iv
    var decipher = crypto.createDecipher("aes-192-cbc", key);
    let result = decipher.update(encryptedData);

    return result.toString("utf8");
}

const { createCipher } = require('node:crypto')
function encrypt1(plaintext, key) {
    // ruleid: create-de-cipher-no-iv
    const cipher = createCipher("aes-256-ccm", key, {authTagLength: 16})
    cipher.setAAD(Buffer.alloc(0), {plaintextLength: plaintext.length})
    let result = cipher.update(plaintext) + cipher.final()

    return result + cipher.getAuthTag()
}

function decrypt3(key, ciphertext) {
    let encrypted = Buffer.from(ciphertext, 'base64');
    let iv = encrypted.slice(encrypted.byteLength - 12, encrypted.byteLength);

    // ok: create-de-cipher-no-iv
    let decipher = crypto.createDecipheriv("aes-256-ocb", key, iv, {authTagLength: 16});
    let decrypted = decipher.update(encrypted.slice(0, encrypted.byteLength - 16 - 12));

    decrypted = Buffer.concat([decrypted]);
    return decrypted;
}

function encrypt2(key, plaintext) {
    let iv = crypto.randomBytes(12);

    // ok: create-de-cipher-no-iv
    let cipher = crypto.createCipheriv("chacha20-poly1305", key, iv);
    let encrypted = Buffer.concat([cipher.update(plaintext), cipher.final(), cipher.getAuthTag()]);
    return encrypted;
}
