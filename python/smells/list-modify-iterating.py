l  = list(range(100))
# ruleid:list-pop-while-iterate
for i in l:
    print(i),
    print(l.pop(0))
    x = l.pop(0)
    print(x)

a = [1, 2, 3, 4]
# ruleid:list-pop-while-iterate
for i in a:
    print(i)
    a.pop(0)

# ruleid:list-pop-while-iterate
for i in a:
    print(i)
    a.append(0)
