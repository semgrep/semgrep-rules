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

# Real-world finding
def download_doc(request):
    # ruleid: user-open
    url = request.GET.get("url")
    format_doc = url.split(".")
    if format_doc[-1] == "docx":
        file_name = str(int(time.time())) + ".docx"
    else:
        file_name = str(int(time.time())) + ".xlsx"

    def file_iterator(_file, chunk_size=512):
        while True:
            c = _file.read(chunk_size)
            if c:
                yield c
            else:
                break

    _file = open(url, "rb")
    response = StreamingHttpResponse(file_iterator(_file))
    response["Content-Type"] = "application/octet-stream"
    response["Content-Disposition"] = "attachment;filename=\"{0}\"".format(file_name)
    return response
