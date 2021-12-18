from django.http import HttpResponse


class Person(models.Model):
    first_name = models.CharField(...)
    last_name = models.CharField(...)
    birth_date = models.DateField(...)


##### True Positives #########
def get_user_age1(request):
    user_name = request.POST.get("user_name")
    user_age = Person.objects.raw( # ruleid: tainted-sql-string
        "SELECT user_age FROM myapp_person where user_name = %s" % user_name
    )
    html = "<html><body>User Age %s.</body></html>" % user_age
    return HttpResponse(html)


def get_user_age2(request):
    user_name = request.POST.get("user_name")
    user_age = Person.objects.raw( # ruleid: tainted-sql-string
        f"SELECT user_age FROM myapp_person where user_name = {user_name}"
    )
    html = "<html><body>User Age %s.</body></html>" % user_age
    return HttpResponse(html)


def get_user_age3(request):
    user_name = request.POST.get("user_name")
    user_age = Person.objects.raw( # ruleid: tainted-sql-string
        "SELECT user_age FROM myapp_person where user_name = %s".format(user_name)
    )
    html = "<html><body>User Age %s.</body></html>" % user_age
    return HttpResponse(html)


def get_user_age4(request):
    user_name = request.POST.get("user_name")
    user_age = Person.objects.raw( # ruleid: tainted-sql-string
        "SELECT user_age FROM myapp_person where user_name = " + user_name
    )
    html = "<html><body>User Age %s.</body></html>" % user_age
    return HttpResponse(html)


def get_user_age5(request):
    user_name = request.GET.get("user_name")
    query = "SELECT user_age FROM myapp_person where user_name = %s"
    # ruleid: tainted-sql-string
    user_age = Person.objects.raw(query % user_name)
    html = "<html><body>User Age %s.</body></html>" % user_age
    return HttpResponse(html)


def get_user_age6(request):
    query = "SELECT user_age FROM myapp_person where user_name = {}"
    # ruleid: tainted-sql-string
    user_age = Person.objects.raw(query.format(request.GET.get("user_name")))
    html = "<html><body>User Age %s.</body></html>" % user_age
    return HttpResponse(html)


def get_users1(request):
    client_id = request.headers.get("client_id")
    users = Person.objects.raw( # ruleid: tainted-sql-string
        "SELECT * FROM myapp_person where client_id = %s" % client_id
    )
    html = "<html><body>Users %s.</body></html>" % users
    return HttpResponse(html)


def get_users2(request):
    client_id = request.headers.get("client_id")
    users = Person.objects.raw( # ruleid: tainted-sql-string
        f"SELECT * FROM myapp_person where client_id = {client_id}"
    )
    html = "<html><body>Users %s.</body></html>" % users
    return HttpResponse(html)


@public
def log_in(request):
    error = ""
    if request.method == "POST":
        username = request.POST["username"]
        password = request.POST["password"]
        # ruleid: tainted-sql-string
        query = """
            SELECT * FROM auth_user
               INNER JOIN authentication_userprofile
               ON auth_user.id = authentication_userprofile.user_id
            WHERE username = '%s'
            AND authentication_userprofile.cleartext_password = '%s';
""" % (
            username,
            password,
        )
        try:
            user = User.objects.raw(query)[0]
        except IndexError:
            user = None
        if user:
            login(request, user)
            return redirect("dash")
        else:
            error = "The credentials you entered are not valid. Try again."

    return render(request, "login.html", {"error": error})


##### True Negatives #########
def get_user_age_ok(request):
    user_name = request.POST.get("user_name")
    # ok: tainted-sql-string
    user_age = Person.objects.filter(user_name=user_name).first()
    html = "<html><body>User Age %s.</body></html>" % user_age
    return HttpResponse(html)


def get_users_ok(request):
    client_id = request.headers.get("client_id")
    # ok: tainted-sql-string
    users = Person.objects.raw(
        "SELECT * FROM myapp_person where client_id = %s", (client_id,)
    )
    html = "<html><body>Users %s.</body></html>" % users
    return HttpResponse(html)
