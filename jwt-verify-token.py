import jwt as tokenizer

def accept_request():
    decode = jwt.decode(token, "password", verify=False)


def accept_request():
    decode = tokenizer.decode(token, "password", verify=False)


def accept_another_request():
    decode= jwt.decode(token,"password")