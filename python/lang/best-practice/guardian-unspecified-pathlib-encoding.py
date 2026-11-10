import zipfile
from pathlib import Path


def load_skill(path: Path):
    # ruleid: guardian-unspecified-pathlib-encoding
    text = path.read_text()
    # ruleid: guardian-unspecified-pathlib-encoding
    path.write_text(text)
    # ruleid: guardian-unspecified-pathlib-encoding
    with path.open() as f:
        f.read()
    # ruleid: guardian-unspecified-pathlib-encoding
    with Path("skills/SKILL.md").open("w") as f:
        f.write(text)
    return text


def ok(path: Path, zf: zipfile.ZipFile, name):
    # ok: guardian-unspecified-pathlib-encoding
    text = path.read_text(encoding="utf-8")
    # ok: guardian-unspecified-pathlib-encoding
    path.write_text(text, encoding="utf-8")
    # ok: guardian-unspecified-pathlib-encoding
    with path.open(encoding="utf-8") as f:
        f.read()
    # ok: guardian-unspecified-pathlib-encoding
    path.read_bytes()
    # ok: guardian-unspecified-pathlib-encoding
    with path.open("rb") as f:
        f.read()
    # ok: guardian-unspecified-pathlib-encoding
    with path.open(mode="wb") as f:
        f.write(b"")
    # ok: guardian-unspecified-pathlib-encoding
    with zf.open(name) as f:
        f.read()
    return text
