import asyncio
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

async def run_exec_inline_get_method_by_event_loop(request):
    # ruleid: user-exec
    loop = asyncio.get_running_loop()
    await loop.run_in_executor(None, exec, request.POST.get("code"))

async def run_exec_inline_dict_by_event_loop(request):
    # ruleid: user-exec
    loop = asyncio.get_running_loop()
    await loop.run_in_executor(None, exec, request.POST["code"])

async def run_exec_by_get_method_event_loop(request):
    # ruleid: user-exec
    code = request.POST.get("code")
    loop = asyncio.get_running_loop()
    await loop.run_in_executor(None, exec, code)

async def run_exec_by_event_loop(request):
    # ruleid: user-exec
    code = request.POST["code"]
    loop = asyncio.get_running_loop()
    await loop.run_in_executor(None, exec, code)
