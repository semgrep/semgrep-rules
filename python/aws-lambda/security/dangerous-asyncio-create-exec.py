import asyncio

class AsyncEventLoop:
    def __enter__(self):
        self.loop = asyncio.new_event_loop()
        asyncio.set_event_loop(self.loop)
        return self.loop

    def __exit__(self, *args):
        self.loop.close()

def handler(event, context):
    args = event['cmds']
    program = args[0]
    with AsyncEventLoop() as loop:
        # ruleid: dangerous-asyncio-create-exec
        proc = loop.run_until_complete(asyncio.subprocess.create_subprocess_exec(program, *args))
        loop.run_until_complete(proc.communicate())

def lambda_handler(event, context):
    program = "bash"
    loop = asyncio.new_event_loop()
    # ruleid: dangerous-asyncio-create-exec
    proc = loop.run_until_complete(asyncio.subprocess.create_subprocess_exec(program, [program, "-c", event['cmd']]))
    loop.run_until_complete(proc.communicate())

def ok_handler(event, context):
    program = "echo"
    loop = asyncio.new_event_loop()
    # ok: dangerous-asyncio-create-exec
    proc = loop.run_until_complete(asyncio.subprocess.create_subprocess_exec(program, [program, "123"]))
    loop.run_until_complete(proc.communicate())
