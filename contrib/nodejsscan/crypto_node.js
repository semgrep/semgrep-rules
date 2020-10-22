var key = new Buffer('8CBDEC62EB4DCA778F842B02503011B2', 'hex')
var src = new Buffer('0002123401010100000000000000c631', 'hex')
// ruleid:node_aes_ecb
cipher = crypto.createCipheriv("aes-128-ecb", key, '')
cipher.setAutoPadding(false)
result = cipher.update(src).toString('hex');
result += cipher.final().toString('hex');
"result   : " + result

// ruleid:node_sha1
require("crypto")
    .createHash("sha1")
    .update("Man oh man do I love node!")
    .digest("hex");

// ruleid:node_md5
require("crypto")
    .createHash("md5")
    .update("Man oh man do I love node!")
    .digest("hex");

function encrypt(text) {
    let iv = crypto.randomBytes(IV_LENGTH);
    // ruleid:node_aes_ecb
    let cipher = crypto.createCipheriv('aes-256-ecb', Buffer.from(ENCRYPTION_KEY), iv);
    // ruleid:node_aes_ecb
    let cipher = crypto.createCipheriv('aes-192-ecb', Buffer.from(ENCRYPTION_KEY), iv);
    // ruleid:node_aes_ecb
    let cipher = crypto.createCipheriv('aes-128-ecb', Buffer.from(ENCRYPTION_KEY), iv);
    let encrypted = cipher.update(text);

    encrypted = Buffer.concat([encrypted, cipher.final()]);

    return iv.toString('hex') + ':' + encrypted.toString('hex');
}

function decrypt(text) {
    let textParts = text.split(':');
    let iv = Buffer.from(textParts.shift(), 'hex');
    let encryptedText = Buffer.from(textParts.join(':'), 'hex');
    // ruleid:node_aes_ecb
    let decipher = crypto.createDecipheriv('aes-128-ecb', Buffer.from(ENCRYPTION_KEY), iv);
    let decrypted = decipher.update(encryptedText);
}

// ruleid:node_insecure_random_generator
crypto.pseudoRandomBytes(1); // <Buffer 45>
//Math based random insecure
// ruleid:node_insecure_random_generator
const val = Math.random();

// ruleid:node_weak_crypto
var des = crypto.createCipher('des', key);
