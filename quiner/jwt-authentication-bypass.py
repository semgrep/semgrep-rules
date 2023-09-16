import jwt as tokenizer

# JWT Auth bypass
def accept_request():
    decode = tokenizer.decode(token, "password", verify=False)

# JWT algorithm bypass
def accept_another_request():
    decode= jwt.decode(token,"password")