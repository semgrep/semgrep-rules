import re, os
from django.http import HttpResponse
from somewhere import APIView

def unsafe(request):
    # ruleid: path-traversal-open
    filename = request.POST.get('filename')
    contents = request.POST.get('contents')
    print("something")
    f = open(filename, 'r')
    f.write(contents)
    f.close()

def unsafe_inline(request):
    # ruleid: path-traversal-open
    f = open(request.GET.get('filename'))
    f.write(request.POST.get('contents'))
    f.close()

def unsafe_dict(request):
    # ruleid: path-traversal-open
    f = open(request.POST['filename'])
    f.write("hello")
    f.close()

def unsafe_with(request):
    # ruleid: path-traversal-open
    filename = request.POST.get("filename")
    with open(filename, 'r') as fin:
        data = fin.read()
    return HttpResponse(data)

def safe(request):
    # ok: path-traversal-open
    filename = "/tmp/data.txt"
    f = open(filename)
    f.write("hello")
    f.close()

# Real-world finding
def download_doc(request):
    # ruleid: path-traversal-open
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

class GenerateUserAPI(APIView):
    def get(self, request):
        """
        download users excel
        """
        # ruleid: path-traversal-open
        file_id = request.GET.get("file_id")
        if not file_id:
            return self.error("Invalid Parameter, file_id is required")
        if not re.match(r"^[a-zA-Z0-9]+$", file_id):
            return self.error("Illegal file_id")
        file_path = f"/tmp/{file_id}.xlsx"
        if not os.path.isfile(file_path):
            return self.error("File does not exist")
        with open(file_path, "rb") as f:
            raw_data = f.read()
        os.remove(file_path)
        response = HttpResponse(raw_data)
        response["Content-Disposition"] = f"attachment; filename=users.xlsx"
        response["Content-Type"] = "application/xlsx"
        return response
