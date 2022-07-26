import asyncio


class AsyncEventLoop:
    def __enter__(self):
        self.loop = asyncio.new_event_loop()
        asyncio.set_event_loop(self.loop)
        return self.loop

    def __exit__(self, *args):
        self.loop.close()


def vuln1():
    args = get_user_input()
    program = args[0]
    with AsyncEventLoop() as loop:
        # fn: dangerous-asyncio-create-exec-tainted-env-args
        proc = loop.run_until_complete(
            asyncio.subprocess.create_subprocess_exec(program, *args)
        )
        loop.run_until_complete(proc.communicate())


def vuln2():
    program = "bash"
    loop = asyncio.new_event_loop()
    proc = loop.run_until_complete(
        # ruleid: dangerous-asyncio-create-exec-tainted-env-args
        asyncio.subprocess.create_subprocess_exec(program, [program, "-c", sys.argv[1]])
    )
    loop.run_until_complete(proc.communicate())


def ok1():
    program = "echo"
    loop = asyncio.new_event_loop()
    # ok: dangerous-asyncio-create-exec-tainted-env-args
    proc = loop.run_until_complete(
        asyncio.subprocess.create_subprocess_exec(program, [program, "123"])
    )
    loop.run_until_complete(proc.communicate())
