l  = list(range(100))
# ruleid:list-pop-while-iterate
for i in l:
    print(i),
    print(l.pop(0))
    x = l.pop(0)
    print(x)

# ruleid:list-pop-while-iterate
a = [1, 2, 3, 4]
for i in a:
    print(i)
    a.pop(0)

# ruleid:list-pop-while-iterate
b = [1, 2, 3, 4]
for i in b:
    print(i)
    b.append(0)

c = []
for i in range(5):
    print(i)
    # ok
    c.append(i)

d = []
e = [1, 2, 3, 4]
for i in e:
    print(i)
    # ok
    d.append(i)