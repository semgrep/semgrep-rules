import _xxsubinterpreters
import sys


def run_payload(payload: str) -> None:
    payload = sys.argv[2]
    # ruleid: dangerous-subinterpreters-run-string-tainted-env-args
    _xxsubinterpreters.run_string(_xxsubinterpreters.create(), payload)


def run_payload(payload: str) -> None:
    # fn: dangerous-subinterpreters-run-string-tainted-env-args
    _xxsubinterpreters.run_string(_xxsubinterpreters.create(), payload)


def okRun():
    # ok: dangerous-subinterpreters-run-string-tainted-env-args
    _xxsubinterpreters.run_string(_xxsubinterpreters.create(), "print(123)")
