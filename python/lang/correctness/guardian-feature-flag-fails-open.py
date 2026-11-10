import os

from django.conf import settings


def billing_v2_enabled():
    # ruleid: guardian-feature-flag-fails-open
    return os.environ.get("BILLING_V2_ROLLOUT_ENABLED", "true") == "true"


def billing_v2_enabled2(flags):
    # ruleid: guardian-feature-flag-fails-open
    return flags.get("billing_v2_rollout", True)


def billing_v2_enabled3():
    # ruleid: guardian-feature-flag-fails-open
    return getattr(settings, "BILLING_V2_FEATURE_ENABLED", True)


def billing_v2_enabled4():
    # ruleid: guardian-feature-flag-fails-open
    return os.getenv("BILLING_V2_ENABLED") != "false"


def billing_v2_enabled5():
    # ruleid: guardian-feature-flag-fails-open
    return os.getenv("BILLING_V2_ENABLED", "").lower() not in ("false", "0")


def ok_defaults_off(flags):
    # ok: guardian-feature-flag-fails-open
    a = os.environ.get("BILLING_V2_ROLLOUT_ENABLED", "false") == "true"
    # ok: guardian-feature-flag-fails-open
    b = flags.get("billing_v2_rollout", False)
    # ok: guardian-feature-flag-fails-open
    c = os.getenv("BILLING_V2_ENABLED") == "true"
    return a and b and c


def ok_unrelated(cfg):
    # ok: guardian-feature-flag-fails-open
    return cfg.get("retries", 1)
