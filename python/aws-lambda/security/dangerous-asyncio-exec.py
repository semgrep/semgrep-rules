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
    args = event['commands']
    with AsyncEventLoop() as loop:
        exit_future = asyncio.Future(loop=loop)
        # ruleid: dangerous-asyncio-exec
        transport, _ = loop.run_until_complete(loop.subprocess_exec(lambda: WaitingProtocol(exit_future), *args))
        loop.run_until_complete(exit_future)
        transport.close()

def lambda_handler(event, context):
    loop = asyncio.new_event_loop()
    exit_future = asyncio.Future(loop=loop)
    cmd = event['cmd']
    # ruleid: dangerous-asyncio-exec
    transport, _ = loop.run_until_complete(loop.subprocess_exec(lambda: WaitingProtocol(exit_future), ["bash", "-c", cmd]))
    loop.run_until_complete(exit_future)
    transport.close()

def ok_handler(event, context):
    loop = asyncio.new_event_loop()
    exit_future = asyncio.Future(loop=loop)
    # ok: dangerous-asyncio-exec
    transport, _ = loop.run_until_complete(loop.subprocess_exec(lambda: WaitingProtocol(exit_future), ["echo", "a"]))
    loop.run_until_complete(exit_future)
    transport.close()
