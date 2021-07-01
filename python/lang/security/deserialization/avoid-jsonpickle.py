import jsonpickle

def run_payload(payload: str) -> None:
    # ruleid: avoid-jsonpickle
    obj = jsonpickle.decode(payload)

def ok():
    # ok: avoid-jsonpickle
    obj = jsonpickle.decode('foobar')
