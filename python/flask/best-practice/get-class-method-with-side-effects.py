import flask

class SomeClass:
    #violation - CRUD operation
    def get(self):
        # ruleid: flask-class-method-get-side-effects
        createRecord(someVar)

    #violation - CRUD operation
    def get(self, arg1):
        print("foo")
        # ruleid: flask-class-method-get-side-effects
        var = updateBar(somearg)

    def get(self,arg1,arg2):
        someFunction()
        # ruleid: flask-class-method-get-side-effects
        DeleteRecord(arg2)
        
class OtherClass:
    #ok
    def get(self, somearg):
        otherFunc("hello world")