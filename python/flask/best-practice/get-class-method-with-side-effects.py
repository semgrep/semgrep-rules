import flask

class SomeClass:
    #violation - CRUD operation
    # ruleid: flask-class-method-get-side-effects
    def get(self):
        createRecord(someVar)

    #violation - CRUD operation
    # ruleid: flask-class-method-get-side-effects
    def get(self, arg1):
        print("foo")
        var = updateBar(somearg)

    # ruleid: flask-class-method-get-side-effects
    def get(self,arg1,arg2):
        someFunction()
        DeleteRecord(arg2)

class OtherClass:
    #ok
    def get(self, somearg):
        otherFunc("hello world")
