import joblib
import numpy
import numpy as np
import pandas
import pandas as pd
import torch


def true_positives(path, url, data, arr):
    # ruleid: avoid-torch-load-untrusted
    torch.load(path)

    # ruleid: avoid-torch-load-untrusted
    torch.load(path, map_location="cpu")

    # ruleid: avoid-joblib-load
    joblib.load(path)

    # ruleid: avoid-pandas-read-pickle
    pandas.read_pickle(url)

    # ruleid: avoid-pandas-read-pickle
    pd.read_pickle(path)

    # ruleid: avoid-numpy-allow-pickle
    numpy.load(path, allow_pickle=True)

    # ruleid: avoid-numpy-allow-pickle
    np.load(path, allow_pickle=True)


def true_negatives(path):
    # ok: avoid-torch-load-untrusted
    torch.load(path, weights_only=True)

    # ok: avoid-torch-load-untrusted
    torch.load("model.pt")

    # ok: avoid-numpy-allow-pickle
    numpy.load(path)

    # ok: avoid-numpy-allow-pickle
    np.load(path, allow_pickle=False)

    # ok: avoid-joblib-load
    joblib.load("model.joblib")
