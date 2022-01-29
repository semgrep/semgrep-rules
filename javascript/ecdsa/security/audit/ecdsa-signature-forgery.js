var ellipticcurve = require("starkbank-ecdsa");
var Ecdsa = ellipticcurve.Ecdsa;
var PrivateKey = ellipticcurve.PrivateKey;

// Generate new Keys
let privateKey = new PrivateKey();
let publicKey = privateKey.publicKey();

let message = "My test message";

// Generate Signature
let signature = Ecdsa.sign(message, privateKey);

// Verify if signature is valid
// ruleid: ecdsa-signature-forgery
console.log(Ecdsa.verify(message, signature, publicKey));

var ellipticecurve2 = require("starkbank-ecdsa");
var Ecdsa2 = ellipticecurve2.Ecdsa;
var Signature = ellipticecurve2.Signature;
var PublicKey = ellipticecurve2.PublicKey;
var File = ellipticecurve2.utils.File;

let publicKeyPem = File.read("publicKey.pem");
let signatureDer = File.read("signatureDer.txt", "binary");
let message2 = File.read("message.txt");

let publicKey2 = PublicKey.fromPem(publicKeyPem);
let signature2 = Signature.fromDer(signatureDer);

// ruleid: ecdsa-signature-forgery
console.log(Ecdsa2.verify(message2, signature2, publicKey2));
