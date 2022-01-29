from ellipticcurve.ecdsa import Ecdsa
from ellipticcurve.privateKey import PrivateKey

# Generate new Keys
privateKey = PrivateKey()
publicKey = privateKey.publicKey()

message = "My test message"

# Generate Signature
signature = Ecdsa.sign(message, privateKey)

# To verify if the signature is valid
# ruleid: ecdsa-signature-forgery
Ecdsa.verify(message, signature, publicKey)

publicKeyPem = File.read("publicKey.pem")
signatureDer = File.read("signatureDer.txt", "rb")
message2 = File.read("message.txt")

publicKey2 = PublicKey.fromPem(publicKeyPem)
signature2 = Signature.fromDer(signatureDer)

# ruleid: ecdsa-signature-forgery
print(Ecdsa.verify(message2, signature2, publicKey2))
