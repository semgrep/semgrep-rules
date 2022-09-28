import asyncio
import sys


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


def vuln0():
    shell_command = sys.argv[2]
    with AsyncEventLoop() as loop:
        exit_future = asyncio.Future(loop=loop)
        transport, _ = loop.run_until_complete(
            # ruleid: dangerous-asyncio-shell-tainted-env-args
            loop.subprocess_shell(lambda: WaitingProtocol(exit_future), shell_command)
        )
        loop.run_until_complete(exit_future)
        transport.close()


def vuln1(shell_command):
    with AsyncEventLoop() as loop:
        exit_future = asyncio.Future(loop=loop)
        transport, _ = loop.run_until_complete(
            # fn: dangerous-asyncio-shell-tainted-env-args
            loop.subprocess_shell(lambda: WaitingProtocol(exit_future), shell_command)
        )
        loop.run_until_complete(exit_future)
        transport.close()


def vuln2(shell_command):
    with AsyncEventLoop() as loop:
        proc = loop.run_until_complete(
            # fn: dangerous-asyncio-shell-tainted-env-args
            asyncio.subprocess.create_subprocess_shell(shell_command)
        )
        loop.run_until_complete(proc.wait())


def ok1():
    shell_command = 'echo "Hello world"'

    with AsyncEventLoop() as loop:
        exit_future = asyncio.Future(loop=loop)
        # ok: dangerous-asyncio-shell-tainted-env-args
        transport, _ = loop.run_until_complete(
            loop.subprocess_shell(lambda: WaitingProtocol(exit_future), shell_command)
        )
        loop.run_until_complete(exit_future)
        transport.close()


def ok2():
    with AsyncEventLoop() as loop:
        # ok: dangerous-asyncio-shell-tainted-env-args
        proc = loop.run_until_complete(
            asyncio.subprocess.create_subprocess_shell('echo "foobar"')
        )
        loop.run_until_complete(proc.wait())
