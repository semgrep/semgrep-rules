def A():
    print_error('test')

    # ruleid:useless-inner-function
    def B():
        print_error('again')

    # ruleid:useless-inner-function
    def C():
        print_error('another')
    return None

def A():
    print_error('test')

    # ok:useless-inner-function
    def B():
        print_error('again')

    # ok:useless-inner-function
    def C():
        print_error('another')

    return B(), C()

def foo():
    # ok:useless-inner-function
    def bar():
        print("hi mom")
    return bar

def create_decorating_metaclass(decorators, prefix='test_'):
    class DecoratingMethodsMetaclass(type):
        # ok:useless-inner-function
        def __new__(cls, name, bases, namespace):
            namespace_items = tuple(namespace.items())
            for key, val in namespace_items:
                if key.startswith(prefix) and callable(val):
                    for dec in decorators:
                        val = dec(val)
                    namespace[key] = val
            return type.__new__(cls, name, bases, dict(namespace))

    return DecoratingMethodsMetaclass

def dec(f):
    @functools.wraps(f)
    # ok:useless-inner-function
    def inner(*args, **kwargs):
        return f(*args, **kwargs)
    result = other_dec(inner)
    return result
