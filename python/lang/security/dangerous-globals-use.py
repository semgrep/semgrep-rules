def test1(request):
    forward = request.GET.get('fwd')
    globs = globals()
    # ruleid: dangerous-globals-use
    function = globs.get(forward)

    if function:
        return function(request)

    env = {'fwd': forward}
    return render(request, 'vulnerable/redirects/forward_failed.html', env)

def test2(request):
    forward = request.GET.get('fwd')
    # ruleid: dangerous-globals-use
    function = locals().get(forward)

    if function:
        return function(request)

    env = {'fwd': forward}
    return render(request, 'vulnerable/redirects/forward_failed.html', env)

def test3(request):
    forward = request.GET.get('fwd')
    # ruleid: dangerous-globals-use
    function = test1.__globals__[forward]

    if function:
        return function(request)

    env = {'fwd': forward}
    return render(request, 'vulnerable/redirects/forward_failed.html', env)

def test4(request):
    forward = request.GET.get('fwd')
    # ruleid: dangerous-globals-use
    result = locals()[forward].__dict__['abs'](-12)

    env = {'fwd': forward}
    return render(request, 'vulnerable/redirects/forward_failed.html', env)

def okTest():
    # ok: dangerous-globals-use
    function = locals().get("test3")

    if function:
        return function(request)

    env = {'fwd': forward}
    return render(request, 'vulnerable/redirects/forward_failed.html', env)

def okTest():
    # ok: dangerous-globals-use
    function = locals().get("test3")

    if function:
        return function(request)

    env = {'fwd': forward}
    return render(request, 'vulnerable/redirects/forward_failed.html', env)

def okTest2(data):
    # ok: dangerous-globals-use
    list_of_globals = globals()
    list_of_globals["foobar"].update(data)

def okTest3(data):
    # ok: dangerous-globals-use
    NS = globals()
    NS['_foobar_' + data] = smth(data)
