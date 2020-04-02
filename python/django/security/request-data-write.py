from django.http import HttpResponse
from . import settings as USettings

def save_scrawl_file(request, filename):
    import base64
    try:
        # ruleid: request-data-write
        content = request.POST.get(USettings.UEditorUploadSettings.get("scrawlFieldName", "upfile"))
        f = open(filename, 'wb')
        f.write(base64.decodestring(content))
        f.close()
        state = "SUCCESS"
    except Exception as e:
        state = u"写入图片文件错误:%s" % e
    return state