

def alwaysblue():
    if isblue():
        return 'blue'
    # ruleid: code-after-unconditional-return
    return 'red'
    return 'green'


def alwaysblue():
    if isblue():
        return 'blue'
    # ruleid: code-after-unconditional-return
    return 'red'
    x = 5

# ruleid: return-not-in-function
return 5