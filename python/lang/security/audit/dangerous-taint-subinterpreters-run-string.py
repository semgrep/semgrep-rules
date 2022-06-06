import _xxsubinterpreters
import sys


def run_payload(payload: str) -> None:
    payload = sys.argv[2]
    # ruleid: dangerous-taint-subinterpreters-run-string
    _xxsubinterpreters.run_string(_xxsubinterpreters.create(), payload)


def run_payload(payload: str) -> None:
    # fn: dangerous-taint-subinterpreters-run-string
    _xxsubinterpreters.run_string(_xxsubinterpreters.create(), payload)


def okRun():
    # ok: dangerous-taint-subinterpreters-run-string
    _xxsubinterpreters.run_string(_xxsubinterpreters.create(), "print(123)")
