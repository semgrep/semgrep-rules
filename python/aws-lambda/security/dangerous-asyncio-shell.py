import asyncio

class AsyncEventLoop:
    def __enter__(self):
        self.loop = asyncio.new_event_loop()
        asyncio.set_event_loop(self.loop)
        return self.loop

    def __exit__(self, *args):
        self.loop.close()

class WaitingProtocol(asyncio.SubprocessProtocol):
    def __init__(self, exit_future):
        self.exit_future = exit_future

    def process_exited(self):
        self.exit_future.set_result(True)

def handler(event, context):
    with AsyncEventLoop() as loop:
        exit_future = asyncio.Future(loop=loop)
        # ruleid: dangerous-asyncio-shell
        transport, _ = loop.run_until_complete(loop.subprocess_shell(lambda: WaitingProtocol(exit_future), event['cmd']))
        loop.run_until_complete(exit_future)
        transport.close()

        # ruleid: dangerous-asyncio-shell
        proc = loop.run_until_complete(asyncio.subprocess.create_subprocess_shell(event['cmd']))
        loop.run_until_complete(proc.wait())

def other_handler(event, context):
    shell_command = 'echo "Hello world"'

    with AsyncEventLoop() as loop:
        exit_future = asyncio.Future(loop=loop)
        # ok: dangerous-asyncio-shell
        transport, _ = loop.run_until_complete(loop.subprocess_shell(lambda: WaitingProtocol(exit_future), shell_command))
        loop.run_until_complete(exit_future)
        transport.close()
        # ok: dangerous-asyncio-shell
        proc = loop.run_until_complete(asyncio.subprocess.create_subprocess_shell('echo "foobar"'))
        loop.run_until_complete(proc.wait())
