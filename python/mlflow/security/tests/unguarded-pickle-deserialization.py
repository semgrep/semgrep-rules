import pickle
import cloudpickle
from mlflow.exceptions import MlflowException
from mlflow.environment_variables import MLFLOW_ALLOW_PICKLE_DESERIALIZATION

def load_model_v1(path):
    with open(path, "rb") as f:
        # ruleid: python.mlflow.security.unguarded-pickle-deserialization
        return pickle.load(f)

def deserialize_bytes(data: bytes):
    # ruleid: python.mlflow.security.unguarded-pickle-deserialization
    return pickle.loads(data)

def load_cloudpickle_model(path):
    with open(path, "rb") as f:
        # ruleid: python.mlflow.security.unguarded-pickle-deserialization
        return cloudpickle.load(f)

def load_model_safe_v1(path):
    if not MLFLOW_ALLOW_PICKLE_DESERIALIZATION.get():
        raise MlflowException("Disabled.")
    with open(path, "rb") as f:
        # ok: python.mlflow.security.unguarded-pickle-deserialization
        return pickle.load(f)

def load_cloudpickle_safe(path):
    if not MLFLOW_ALLOW_PICKLE_DESERIALIZATION.get():
        raise MlflowException("Disabled.")
    with open(path, "rb") as f:
        # ok: python.mlflow.security.unguarded-pickle-deserialization
        return cloudpickle.load(f)

def safe_loads(data: bytes):
    if not MLFLOW_ALLOW_PICKLE_DESERIALIZATION.get():
        raise MlflowException("Disabled.")
    # ok: python.mlflow.security.unguarded-pickle-deserialization
    return pickle.loads(data)
