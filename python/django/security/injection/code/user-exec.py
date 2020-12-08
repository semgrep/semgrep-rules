from textwrap import dedent

def unsafe(request):
    # ruleid: user-exec
    code = request.POST.get('code')
    print("something")
    exec(code)

def unsafe_inline(request):
    # ruleid: user-exec
    exec(request.GET.get('code'))

def unsafe_dict(request):
    # ruleid: user-exec
    exec(request.POST['code'])

def safe(request):
    # ok: user-exec
    code = """
    print('hello')
    """
    exec(dedent(code))
