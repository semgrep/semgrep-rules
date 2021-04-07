import requests

class FOO(resource):
    method_decorators = decorator()
    def get(self, somearg):
        createRecord(somearg)
    
    def get(self, arg1):
        print("foo")
        string = "foo".format(arg1)
        foo = requests.get(string)

    def get(self, somearg):
        otherFunc("hello world")

    def get2(self,arg2):
        someFn()
        bar = requests.get("foo".format(arg2))

