import zipfile

LIMIT = 1 << 20


def preview(path, name):
    with zipfile.ZipFile(path) as zf:
        # ruleid: guardian-zipfile-unbounded-member-read
        return zf.read(name)[:LIMIT]


def preview2(path, name):
    zf = zipfile.ZipFile(path)
    # ruleid: guardian-zipfile-unbounded-member-read
    data = zf.open(name).read()
    with zf.open(name) as fh:
        # ruleid: guardian-zipfile-unbounded-member-read
        more = fh.read()
    return data + more


def preview3(zf: zipfile.ZipFile, name):
    # ruleid: guardian-zipfile-unbounded-member-read
    return zf.read(name)


def one_liner(path, name):
    # ruleid: guardian-zipfile-unbounded-member-read
    return zipfile.ZipFile(path).read(name)


def ok_streamed(path, name):
    with zipfile.ZipFile(path) as zf:
        with zf.open(name) as fh:
            # ok: guardian-zipfile-unbounded-member-read
            return fh.read(LIMIT + 1)


def ok_size_checked(path, name):
    with zipfile.ZipFile(path) as zf:
        info = zf.getinfo(name)
        if info.file_size > LIMIT:
            raise ValueError("member too large")
        # ok: guardian-zipfile-unbounded-member-read
        return zf.read(name)


def ok_not_zip(f):
    # ok: guardian-zipfile-unbounded-member-read
    return f.read()
