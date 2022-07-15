def handler(event, context):
    # ok:tainted-code-exec
    exec("x = 1; x = x + 2")

    blah1 = "import requests; r = requests.get('https://example.com')"
    # ok:tainted-code-exec
    exec(blah1)

    dynamic1 = "import requests; r = requests.get('{}')"
    # ruleid:tainted-code-exec
    exec(dynamic1.format(event['url']))

    # ok:tainted-code-exec
    eval("x = 1; x = x + 2")

    blah2 = "import requests; r = requests.get('https://example.com')"
    # ok:tainted-code-exec
    eval(blah2)

    dynamic2 = "import requests; r = requests.get('{}')"
    # ruleid:tainted-code-exec
    eval(dynamic2.format(event['url']))
