# ok:eval-detected
eval("x = 1; x = x + 2")

# ok:eval-detected
eval(f"x = 1; x = x + 2")

blah = "import requests; r = requests.get('https://example.com')"
# ok:eval-detected
eval(blah)

dynamic = "import requests; r = requests.get('{}')"
# ruleid:eval-detected
eval(dynamic.format("https://example.com"))


def eval_something(something):
    # ruleid:eval-detected
    eval(something)


from something import eval

# ok:eval-detected
eval("something")

# ok:eval-detected
eval("somethin(){}")

# ok:eval-detected
eval(f"something()")

# ok:eval-detected
eval("")

# ok:eval-detected
eval(f"")

user_input = get_userinput()
# ruleid:eval-detected
eval(f"some_func({user_input})")

def eval_something(something):
    # ruleid:eval-detected
    eval(f"some_func({{{something}}})")
