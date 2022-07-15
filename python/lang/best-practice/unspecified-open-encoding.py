def func1():
    # ruleid:unspecified-open-encoding
    fd = open('foo')
    fd.close()

def func2():
    # ruleid:unspecified-open-encoding
    fd = open('foo', mode="w")
    fd.close()

def func3():
    import os
    db_root="test"
    # ruleid:unspecified-open-encoding
    with open(os.path.join(db_root, "data.json")) as f:
        i = 2

def func4():
    import os
    # ruleid:unspecified-open-encoding
    with open(os.path.join("test", "b", mode="b")) as f:
        i = 2

def func15():
    # ruleid:unspecified-open-encoding
    fd = open('foo', buffering=1)
    fd.close()

def func5():
    # ok:unspecified-open-encoding
    fd = open('foo', 'b', closefd=True)
    fd.close()

def func6():
    # ok:unspecified-open-encoding
    fd = open('foo', mode="b")
    fd.close()

def func7():
    # ok:unspecified-open-encoding
    fd = open('foo', encoding='utf-8')
    fd.close()

def func8():
    # ok:unspecified-open-encoding
    fd = open('foo', encoding="utf-8", mode="w")
    fd.close()

def func9():
    # ok:unspecified-open-encoding
    fd = open('foo', "w", 2, 'utf-8')
    fd.close()

def func10():
    # ok:unspecified-open-encoding
    fd = open('foo', "w", encoding='utf-8')
    fd.close()

def func11():
    # ok:unspecified-open-encoding
    fd = open('foo', "w", 2, encoding='utf-8')
    fd.close()

def func12():
    # ok:unspecified-open-encoding
    fd = open('foo', "b", 0)
    fd.close()

def func13():
    # ok:unspecified-open-encoding
    fd = open('foo', buffering=0, mode="aba")
    fd.close()

def func14():
    # ok:unspecified-open-encoding
    fd = open('foo', encoding="utf-8")
    fd.close()
