# ruleid:use-earliest-or-latest
Entry.objects.order_by()[0]

# ruleid:use-earliest-or-latest
Entry.objects.all().order_by('foo')[0]

# ruleid:use-earliest-or-latest
Entry.objects.all().filter().order_by('foo')[0]