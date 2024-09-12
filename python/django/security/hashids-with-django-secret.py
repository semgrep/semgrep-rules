# https://github.com/crowdresearch/daemo/blob/36e3b70d4e2c06b4853e9209a4916f8301ed6464/crowdsourcing/serializers/task.py#L435-L437
from django.conf import settings
from hashids import Hashids
# ruleid: hashids-with-django-secret
identifier = Hashids(salt=settings.SECRET_KEY, min_length=settings.ID_HASH_MIN_LENGTH)

# https://github.com/pythonitalia/pycon-quiz/blob/7fe11ab96815edad4cf1ed0bdd8ba52d9438ffa0/backend/django_hashids/hashids.py
from django.conf import settings
from hashids import Hashids


def get_hashids():
# ruleid: hashids-with-django-secret
    return Hashids(
        salt=settings.SECRET_KEY, min_length=4, alphabet="abcdefghijklmnopqrstuvwxyz"
    )

# https://github.com/made-with-future/django-common/blob/dc68c93209a71c63dbf0241b997ab8e67697b3a5/common/models.py#L45
class UIDMixin(models.Model):

    objects = UIDManager()

    _hashids = None

    def __init__(self, *args, **kwargs):
        super(UIDMixin, self).__init__(*args, **kwargs)

    @classmethod
    def hashids(cls):
        if not cls._hashids:
            md5 = hashlib.md5()
            md5.update('{}{}'.format(settings.SECRET_KEY, cls.__name__))
# ok: hashids-with-django-secret
            cls._hashids = Hashids(salt=md5.hexdigest(), min_length=16)
        return cls._hashids

# https://github.com/duthaho/aicontest/blob/f6bdcc785b66842be65a8086938d198d65f27650/coding/services/util.py
from contextlib import suppress
import random
import string

from django.conf import settings
from hashids import Hashids


def get_random_string(length: int) -> str:
    # choose from all lowercase letter
    letters = string.ascii_lowercase + string.digits
    return "".join(random.choice(letters) for i in range(length))


def id_to_hash(id: int, length: int = 6) -> str:
    alphabet = string.ascii_letters + string.digits
# ruleid: hashids-with-django-secret
    return Hashids(settings.SECRET_KEY, min_length=length, alphabet=alphabet).encrypt(
        id
    )


def safe_int(num: any, default: int = 0) -> int:
    with suppress(Exception):
        return int(num)
    return default
