from django.contrib.auth import login
from django.shortcuts import redirect
from django.views import View
from django.views.decorators.http import require_POST


def accept_invitation(request, token):
    invite = Invitation.objects.get(token=token)
    # ruleid: django-session-change-on-get
    request.session["household_id"] = invite.household_id
    # ruleid: django-session-change-on-get
    login(request, invite.user)
    return redirect("/")


class InviteView(View):
    def get(self, request, token):
        invite = Invitation.objects.get(token=token)
        # ruleid: django-session-change-on-get
        request.session["household_id"] = invite.household_id
        return redirect("/")

    def post(self, request, token):
        invite = Invitation.objects.get(token=token)
        # ok: django-session-change-on-get
        request.session["household_id"] = invite.household_id
        return redirect("/")


@require_POST
def accept_invitation_post(request, token):
    invite = Invitation.objects.get(token=token)
    # ok: django-session-change-on-get
    login(request, invite.user)
    return redirect("/")


def accept_invitation_guarded(request, token):
    if request.method != "POST":
        return render_confirm(request, token)
    invite = Invitation.objects.get(token=token)
    # ok: django-session-change-on-get
    login(request, invite.user)
    return redirect("/")


def accept_invitation_branch(request, token):
    if request.method == "POST":
        # ok: django-session-change-on-get
        login(request, Invitation.objects.get(token=token).user)
        return redirect("/")
    return render_confirm(request, token)


def cart(request):
    # ok: django-session-change-on-get
    request.session["cart"] = []
    return redirect("/")
