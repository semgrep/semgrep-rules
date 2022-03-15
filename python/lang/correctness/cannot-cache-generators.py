import functools
from functools import lru_cache


# ok: cannot-cache-generators
@functools.lru_cache(maxsize=10)
def not_a_generator():
    return 1

# ok: cannot-cache-generators
@lru_cache(maxsize=10)
def not_a_generator():
    return 1


# ok: cannot-cache-generators
@lru_cache
def not_a_generator():
    return 1


# ruleid: cannot-cache-generators
@functools.lru_cache(maxsize=10)
def generator():
    yield 1

# ruleid: cannot-cache-generators
@lru_cache(maxsize=10)
def generator():
    yield 1


# ruleid: cannot-cache-generators
@lru_cache
def generator():
    yield 1
