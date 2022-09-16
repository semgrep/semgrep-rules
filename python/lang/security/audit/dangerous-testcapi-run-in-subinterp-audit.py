import _testcapi
from test import support

def run_payload1(payload: str) -> None:
    # ruleid: dangerous-testcapi-run-in-subinterp-audit
    _testcapi.run_in_subinterp(payload)

def run_payload2(payload: str) -> None:
    # ruleid: dangerous-testcapi-run-in-subinterp-audit
    support.run_in_subinterp(payload)

def okTest(payload: str) -> None:
    # ok: dangerous-testcapi-run-in-subinterp-audit
    _testcapi.run_in_subinterp("print('Hello world')")
