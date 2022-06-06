import sys
import _testcapi
from test import support


def bad1() -> None:
    payload = sys.argv[1]
    # ruleid: dangerous-taint-testcapi-run-in-subinterp
    _testcapi.run_in_subinterp(payload)


def bad2() -> None:
    payload = sys.argv[1]
    # ruleid: dangerous-taint-testcapi-run-in-subinterp
    support.run_in_subinterp(payload)


def fn1(payload: str) -> None:
    # fn: dangerous-taint-testcapi-run-in-subinterp
    _testcapi.run_in_subinterp(payload)


def fn2(payload: str) -> None:
    # fn: dangerous-taint-testcapi-run-in-subinterp
    support.run_in_subinterp(payload)


def okTest(payload: str) -> None:
    # ok: dangerous-taint-testcapi-run-in-subinterp
    _testcapi.run_in_subinterp("print('Hello world')")
