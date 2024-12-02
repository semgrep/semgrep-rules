import uuid
def example_1():
    # ruleid:insecure-uuid-version
    uuid = uuid.uuid1()

from uuid import uuid1
def example_2():
    # ruleid:insecure-uuid-version
    uuid = uuid1()

from uuid import *
def example_3():
    # ruleid:insecure-uuid-version
    uuid = uuid1() 

import uuid
def unrelated_function():
    # ok:insecure-uuid-version
    uuid = uuid4()
