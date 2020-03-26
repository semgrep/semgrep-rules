import os
import ujson
from typing import Any, Dict, List

from django.http import HttpRequest, HttpResponse, HttpResponseBadRequest
from django.shortcuts import render
from django.test import Client
from django.contrib.auth.password_validation import validate_password
from django.core.exceptions import ValidationError

from tests import example_user
from models import UserProfile
from backend import EmailAuthBackend

def test_email_auth_backend_empty_password(user_profile: UserProfile) -> None:
	user_profile = example_user('hamlet')
	password = "testpassword"
	try:
		validate_password(password)
	except ValidationError as e:
		return HttpResponseBadRequest(str(e))
    # ok
	user_profile.set_password(password)
	user_profile.save()

	user_profile.assertIsNotNone(EmailAuthBackend().authenticate(username=user_profile.example_email('hamlet'), password=password))


def other(user_profile: UserProfile) -> None:
	user_profile = example_user('hamlet')
	password = "testpassword"
    # ruleid: unvalidated-password
	user_profile.set_password(password)
	user_profile.save()

	user_profile.assertIsNotNone(EmailAuthBackend().authenticate(username=user_profile.example_email('hamlet'), password=password))