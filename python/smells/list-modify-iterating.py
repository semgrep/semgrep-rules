l  = list(range(100))
for i in l:                         
    print(i),
    # ruleid:list-pop-while-iterate                        
    print(l.pop(0))
    # ruleid:list-pop-while-iterate                 
    x = l.pop(0)
    print(x)

a = [1, 2, 3, 4]
for i in a:
    print(i)
    # ruleid:list-pop-while-iterate
    a.pop(0)

for i in a:
    print(i)
    # ruleid:list-pop-while-iterate
    a.append(0)