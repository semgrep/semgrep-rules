import code

def run_payload1(payload: str) -> None:
    console = code.InteractiveConsole()
    # ruleid: dangerous-interactive-code-run
    console.push(payload)

def run_payload2(payload: str) -> None:
    inperpreter = code.InteractiveInterpreter()
    # ruleid: dangerous-interactive-code-run
    inperpreter.runcode(code.compile_command(payload))

def run_payload3(payload: str) -> None:
    inperpreter = code.InteractiveInterpreter()
    # ruleid: dangerous-interactive-code-run
    pl = code.compile_command(payload)
    inperpreter.runcode(pl)

def run_payload4(payload: str) -> None:
    inperpreter = code.InteractiveInterpreter()
    # ruleid: dangerous-interactive-code-run
    inperpreter.runsource(payload)

def ok1() -> None:
    console = code.InteractiveConsole()
    console.push('print(123)')

def ok2() -> None:
    inperpreter = code.InteractiveInterpreter()
    inperpreter.runcode(code.compile_command('print(123)'))

def ok3() -> None:
    inperpreter = code.InteractiveInterpreter()
    pl = code.compile_command('print(123)')
    inperpreter.runcode(pl)

def ok4() -> None:
    inperpreter = code.InteractiveInterpreter()
    inperpreter.runsource('print(123)')
