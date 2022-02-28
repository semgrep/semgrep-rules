from attrs import define
from attrs import field


@attr.s(auto_attribs=True)
class ExampleClass(object):
    # ruleid:attr-mutable-initializer
    empty_dict = {}
    # ruleid:attr-mutable-initializer
    empty_list = []
    # ruleid:attr-mutable-initializer
    somedict = dict()
    # ruleid:attr-mutable-initializer
    somelist = list()
    # ruleid:attr-mutable-initializer
    someset = set()
    # ok:attr-mutable-initializer
    ex_good1 = attr.ib(factory=dict)
    # ok:attr-mutable-initializer
    ex_good2 = attr.ib(factory=list)
    # ok:attr-mutable-initializer
    ex_good3 = attr.ib(factory=set)
    # ruleid:attr-mutable-initializer
    myset = {1, 2, 3}

    def foo(self):
        # ok:attr-mutable-initializer
        x = {}

    def bar(self) -> int:
        # ok:attr-mutable-initializer
        thisset = set()


@define
class ExampleClass(object):
    # ruleid:attr-mutable-initializer
    empty_dict = {}
    # ruleid:attr-mutable-initializer
    empty_list = []
    # ruleid:attr-mutable-initializer
    somedict = dict()
    # ruleid:attr-mutable-initializer
    somelist = list()
    # ruleid:attr-mutable-initializer
    someset = set()
    # ok:attr-mutable-initializer
    ex_good1 = field(factory=dict)
    # ok:attr-mutable-initializer
    ex_good2 = field(factory=list)
    # ok:attr-mutable-initializer
    ex_good3 = field(factory=set)
    # ruleid:attr-mutable-initializer
    myset = {1, 2, 3}

    def foo(self):
        # ok:attr-mutable-initializer
        x = {}

    def bar(self) -> int:
        # ok:attr-mutable-initializer
        thisset = set()
