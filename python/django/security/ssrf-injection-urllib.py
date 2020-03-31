def test1():
    from urllib.request import urlopen
    from django.shortcuts import render

    def send_to_redis(request):
        # ruleid: ssrf-injection-urllib
        bucket = request.get("bucket")
        inner_response = urlopen("http://my.redis.foo/{}".format(bucket), data=3)
        return render({"response_code": inner_response.status_code})

def test2():
    from urllib.request import urlopen
    from django.http import HttpResponse

    def send_to_redis(request):
        # ruleid: ssrf-injection-requests
        bucket = request.get("bucket")
        inner_response = urlopen("http://my.redis.foo/{}".format(bucket), data=3)
        return HttpResponse(body = {"response_code": inner_response.status_code})
