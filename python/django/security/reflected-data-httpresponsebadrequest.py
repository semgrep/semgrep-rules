import urllib
from django.db.models import Q
from django.auth import User
from django.http import HttpResponse, HttpResponseBadRequest
from django.utils.translation import ugettext as _

def search_certificates(request):
    # ruleid: reflected-data-httpresponse
    user_filter = request.GET.get("user", "")
    if not user_filter:
        msg = _("user is not given.")
        return HttpResponseBadRequest(msg)


    user = User.objects.get(Q(email=user_filter) | Q(username=user_filter))
    if user.DoesNotExist:
        return HttpResponseBadRequest(_("user '{user}' does not exist").format(user_filter))