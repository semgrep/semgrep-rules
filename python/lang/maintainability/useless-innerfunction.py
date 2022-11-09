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

    # ok:useless-inner-function
    @something
    def D():
        print_error('with decorator')

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
    # ok:useless-inner-function
    def inner(*args, **kwargs):
        return f(*args, **kwargs)
    result = other_dec(inner)
    return result

def decorator_factory( foo ):
    def decorator( function ):
        # https://github.com/returntocorp/semgrep-rules/issues/660
        # todook:useless-inner-function
        def function_wrapper( *args, **kwargs ):
            # Do something with 'foo'.
            return function( *args, **kwargs )
        return function_wrapper
    return decorator

@decorator_factory( 'bar' )
def test( ): ''' Simple reproducer. '''
