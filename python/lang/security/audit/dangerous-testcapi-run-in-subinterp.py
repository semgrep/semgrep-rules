import _testcapi

def run_payload(payload: str) -> None:
    # ruleid: dangerous-testcapi-run-in-subinterp
    _testcapi.run_in_subinterp(payload)

def okTest(payload: str) -> None:
    # ok: dangerous-testcapi-run-in-subinterp
    _testcapi.run_in_subinterp("print('Hello world')")
