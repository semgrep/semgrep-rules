import json

from django.db.models import Count, F, FilteredRelation, Q
from django.http import JsonResponse

GROUPABLE = {"region": "data__region", "plan": "data__plan"}
SORTABLE = {"newest": "-created_at", "oldest": "created_at"}


# CVE-2024-42005 shape: a client-chosen JSON key passed to values()
def breakdown(request):
    key = request.GET["group_by"]
    # ruleid: django-orm-alias-injection
    rows = Report.objects.values(f"data__{key}").annotate(n=Count("id"))
    # ok: django-orm-alias-injection
    rows = Report.objects.values(GROUPABLE.get("region", "data__region")).annotate(n=Count("id"))
    return JsonResponse({"rows": list(rows)})


def export(request):
    fields = request.GET.getlist("fields")
    # ruleid: django-orm-alias-injection
    rows = Customer.objects.values_list(*fields)
    # ok: django-orm-alias-injection
    rows = Customer.objects.filter(name__in=fields).values_list("id", flat=True)
    return JsonResponse({"rows": list(rows)})


# CVE-2025-57833 shape: a client dictionary expanded into annotate()
def books(request):
    filters = json.loads(request.body)
    rels = {
        name: FilteredRelation("author", condition=Q(author__name=value))
        # ruleid: django-orm-alias-injection
        for name, value in filters.items()
    }
    qs = Book.objects.annotate(**rels)
    # ok: django-orm-alias-injection
    qs = Book.objects.annotate(by_author=FilteredRelation("author", condition=Q(author__name=filters.get("author"))))
    return JsonResponse({"n": qs.count()})


def totals(request):
    # ruleid: django-orm-alias-injection
    stats = Order.objects.aggregate(**{request.GET["label"]: Count("id")})
    # ok: django-orm-alias-injection
    stats = Order.objects.aggregate(total=Count("id"))
    return JsonResponse(stats)


# order_by() with a request value (the CVE-2021-35042 family)
class OrderListView(View):
    def get(self, request):
        sort = request.GET.get("sort", "created_at")
        # ruleid: django-orm-alias-injection
        orders = Order.objects.order_by(sort)
        # ok: django-orm-alias-injection
        orders = Order.objects.order_by(SORTABLE.get(sort, "created_at"))
        if sort not in ("created_at", "-created_at", "total"):
            sort = "created_at"
        # ok: django-orm-alias-injection
        orders = Order.objects.order_by(sort)
        return JsonResponse({"n": orders.count()})


def internal_report(fields):
    # ok: django-orm-alias-injection
    return Report.objects.values(*fields)
