from textwrap import dedent

def unsafe(request):
    # ruleid: user-eval-format-string
    message = request.POST.get('message')
    print("do stuff here")
    code = """
    print(%s)
    """ % message
    eval(code)

def unsafe_inline(request):
    # ruleid: user-eval
    eval("print(%s)" % request.GET.get('message'))

def unsafe_dict(request):
    # ruleid: user-eval
    eval("print(%s)" % request.POST['message'])

def safe(request):
    # ok
    code = """
    print('hello')
    """
    eval(dedent(code))

def fmt_unsafe(request):
    # ruleid: user-eval-format-string
    message = request.POST.get('message')
    print("do stuff here")
    code = """
    print({})
    """.format(message)
    eval(code)

def fmt_unsafe_inline(request):
    # ruleid: user-eval
    eval("print({})".format(request.GET.get('message')))

def fmt_unsafe_dict(request):
    # ruleid: user-eval
    eval("print({}, {})".format(request.POST['message'], "pwned"))

def fmt_safe(request):
    # ok
    code = """
    print('hello')
    """
    eval(dedent(code))