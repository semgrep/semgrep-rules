import sys
import _testcapi
from test import support


def bad1() -> None:
    payload = sys.argv[1]
    # ruleid: dangerous-testcapi-run-in-subinterp-tainted-env-args
    _testcapi.run_in_subinterp(payload)


def bad2() -> None:
    payload = sys.argv[1]
    # ruleid: dangerous-testcapi-run-in-subinterp-tainted-env-args
    support.run_in_subinterp(payload)


def fn1(payload: str) -> None:
    # fn: dangerous-testcapi-run-in-subinterp-tainted-env-args
    _testcapi.run_in_subinterp(payload)


def fn2(payload: str) -> None:
    # fn: dangerous-testcapi-run-in-subinterp-tainted-env-args
    support.run_in_subinterp(payload)


def okTest(payload: str) -> None:
    # ok: dangerous-testcapi-run-in-subinterp-tainted-env-args
    _testcapi.run_in_subinterp("print('Hello world')")
