from django.http import HttpResponse

def unsafe(request):
    # ruleid: user-open
    filename = request.POST.get('filename')
    contents = request.POST.get('contents')
    print("something")
    f = open(filename, 'r')
    f.write(contents)
    f.close()

def unsafe_inline(request):
    # ruleid: user-open
    f = open(request.GET.get('filename'))
    f.write(request.POST.get('contents'))
    f.close()

def unsafe_dict(request):
    # ruleid: user-open
    f = open(request.POST['filename'])
    f.write("hello")
    f.close()

def unsafe_with(request):
    # ruleid: user-open
    filename = request.POST.get("filename")
    with open(filename, 'r') as fin:
        data = fin.read()
    return HttpResponse(data)

def safe(request):
    # ok
    filename = "/tmp/data.txt"
    f = open(filename)
    f.write("hello")
    f.close()