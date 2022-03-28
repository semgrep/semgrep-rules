import importlib
from werkzeug.datastructures import FileStorage
from pathlib import Path
import shutil

def run_payload(file_upload: FileStorage, import_name: str) -> None:
    if ".." in file_upload.filename or "/" in file_upload.filename:
        raise Exception(
            "Path traversal attempt. '..' and '/' not allowed in file name"
        )

    temp_folder = Path(__file__).parent.parent / "tmp"
    temp_folder.mkdir()
    temp_file = temp_folder / file_upload.filename

    file_upload.save(temp_file)

    try:
        # ruleid: non-literal-import
        importlib.import_module(import_name)

        # Do stuff
    finally:
        shutil.rmtree(str(temp_folder))

def ok():
    # ok: non-literal-import
    importlib.import_module("foobar")
    foobar()
