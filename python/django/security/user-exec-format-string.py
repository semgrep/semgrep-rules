from textwrap import dedent

def unsafe(request):
    # ruleid: user-exec-format-string
    message = request.POST.get('message')
    print("do stuff here")
    code = """
    print(%s)
    """ % message
    exec(code)

def unsafe_inline(request):
    # ruleid: user-exec
    exec("print(%s)" % request.GET.get('message'))

def unsafe_dict(request):
    # ruleid: user-exec
    exec("print(%s)" % request.POST['message'])

def safe(request):
    # ok
    code = """
    print('hello')
    """
    exec(dedent(code))

def fmt_unsafe(request):
    # ruleid: user-exec-format-string
    message = request.POST.get('message')
    print("do stuff here")
    code = """
    print({})
    """.format(message)
    exec(code)

def fmt_unsafe_inline(request):
    # ruleid: user-exec
    exec("print({})".format(request.GET.get('message')))

def fmt_unsafe_dict(request):
    # ruleid: user-exec
    exec("print({}, {})".format(request.POST['message'], "pwned"))

def fmt_safe(request):
    # ok
    code = """
    print('hello')
    """
    exec(dedent(code))