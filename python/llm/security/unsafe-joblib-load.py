import joblib

# ruleid: unsafe-joblib-load
joblib.load("untrusted_file.pkl")

# ok: unsafe-joblib-load
joblib.load("trusted_file.pkl", safe_mode=True)


def unsafe_load(filename):
    # ruleid: unsafe-joblib-load
    return joblib.load(filename)


def safe_load(filename):
    # ok: unsafe-joblib-load
    return joblib.load(filename, safe_mode=True)
