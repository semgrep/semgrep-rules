import flask

class SomeClass:
    #violation - CRUD operation
    def get(self):
        createRecord(someVar)

    #violation - CRUD operation
    def get(self, arg1):
        print("foo")
        var = updateBar(somearg)

    #ok
    def get(self, somearg):
        otherFunc("hello world")