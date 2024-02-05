from django.shortcuts import render, redirect
from .models import *
from .forms import *


# The idea here is to create an model object called a Tournament, with a form for creation called CreateTournamentForm()
# 
# Django best practices are to use form.cleaned_data[] after validation to ensure you're accessing well-sanitized data:
# https://docs.djangoproject.com/en/4.2/ref/forms/api/#accessing-clean-data
# 
# Some fairly typical django form object creation handlers
# This handler does NOT use request.cleaned_data[], even after form.is_valid() has run
def create_new_tournament_dangerous(request):
    if request.method == 'POST':
        form = CreateTournamentForm(request.POST)
        if form.is_valid():
# ruleid: django-using-request-post-after-is-valid            
            t = Tournament(name=request.POST['name'])
            t.save()
            return redirect('index')
    else:
        context = { 'form': CreateTournamentForm()}
        return render(request, 'create_tournament.html', context)

# This handler DOES use request.cleaned_data[], even after form.is_valid() has run
def create_new_tournament_safe(request):
    if request.method == 'POST':
        form = CreateTournamentForm(request.POST)
        if form.is_valid():
# ok: django-using-request-post-after-is-valid
            t = Tournament(name=form.cleaned_data['name'])
            t.save()
            return redirect('index')
    else:
        context = { 'form': CreateTournamentForm()}
        return render(request, 'create_tournament.html', context)
