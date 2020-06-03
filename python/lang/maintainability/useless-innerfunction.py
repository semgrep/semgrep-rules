# ruleid:useless-inner-function
def A():
    print_error('test')

    def B():
        print_error('again')

    def C():
        print_error('another')
    return None

# ruleid:useless-inner-function
def A():
    print_error('test')

    def B():
        print_error('again')

    def C():
        print_error('another')
    return B(), C()

def A():
    def bench():
        time.sleep(5)
    
    benchmark(bench)


# TODO: support this case
#def A():
#    @benchmark
#    def bench():
#        time.sleep(5)    

def create_decorating_metaclass(decorators, prefix='test_'):
    class DecoratingMethodsMetaclass(type):
        def __new__(cls, name, bases, namespace):
            namespace_items = tuple(namespace.items())
            for key, val in namespace_items:
                if key.startswith(prefix) and callable(val):
                    for dec in decorators:
                        val = dec(val)
                    namespace[key] = val
            return type.__new__(cls, name, bases, dict(namespace))

    return DecoratingMethodsMetaclass