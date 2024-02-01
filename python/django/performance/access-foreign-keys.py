from django.http import HttpResponse
from models import User


def cool_view(request):
    # ok: access-foreign-keys
    return HttpResponse({"user_id": request.user.id})


def other():
    # ruleid: access-foreign-keys
    print(User.user.id)


class View(APIView):
    def get_queryset(self):
        # ok: access-foreign-keys
        print(self.request.user.id)
        return super().get_queryset()
