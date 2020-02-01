a, b, c = 1

# ruleid: useless-if-conditional
if a:
    print('1')
elif a:
    print('2')

# ruleid: useless-if-body
if a:
    print('1')
else:
    print('1')

# ruleid: useless-if-body
if a:
    print('1')
elif b:
    print('1')


# ruleid: useless-if-body
if a:
    print('this is a')
elif b:
    print('this is b')
elif c:
    print('this is c')
elif d:
    print('this is d')


if a:
    print('this is a')
# ruleid: useless-if-body
elif b:
    print('this is b')
elif c:
    print('this is b')
