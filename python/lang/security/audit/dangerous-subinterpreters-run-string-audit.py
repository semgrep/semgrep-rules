import _xxsubinterpreters

def run_payload(payload: str) -> None:
    # ruleid: dangerous-subinterpreters-run-string-audit
    _xxsubinterpreters.run_string(_xxsubinterpreters.create(), payload)

def okRun():
    # ok: dangerous-subinterpreters-run-string-audit
    _xxsubinterpreters.run_string(_xxsubinterpreters.create(), "print(123)")
