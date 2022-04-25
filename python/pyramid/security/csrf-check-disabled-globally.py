from pyramid.csrf import CookieCSRFStoragePolicy


def includeme_bad(config):
    config.set_csrf_storage_policy(CookieCSRFStoragePolicy())
    # ruleid: pyramid-csrf-check-disabled-globally
    config.set_default_csrf_options(require_csrf=False)


def includeme_good(config):
    config.set_csrf_storage_policy(CookieCSRFStoragePolicy())
    # ok: pyramid-csrf-check-disabled-globally
    config.set_default_csrf_options(require_csrf=True)
