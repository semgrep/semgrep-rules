from typing import List, Set, Dict, Tuple, Optional, get_type_hints

class C:
    member: int = 0

def smth(payload):
  # ruleid: dangerous-annotations-usage
  C.__annotations__["member"] = payload
  get_type_hints(C)

def ok1():
  # ok: dangerous-annotations-usage
  C.__annotations__["member"] = int
  get_type_hints(C)

def ok2():
  # ok: dangerous-annotations-usage
  C.__annotations__["member"] = List
  get_type_hints(C)
