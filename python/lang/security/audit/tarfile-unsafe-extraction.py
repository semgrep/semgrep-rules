import tarfile
import zipfile


def unsafe_context_manager(archive_path, dest):
    with tarfile.open(archive_path) as tar:
        # ruleid: tarfile-unsafe-extraction
        tar.extractall(dest)


def unsafe_assigned(archive_path, dest):
    tar = tarfile.open(archive_path)
    # ruleid: tarfile-unsafe-extraction
    tar.extractall(path=dest)
    tar.close()


def unsafe_chained(archive_path, dest):
    # ruleid: tarfile-unsafe-extraction
    tarfile.open(archive_path).extractall(dest)


def unsafe_single_member(archive_path, dest, member):
    with tarfile.open(archive_path) as tar:
        # ruleid: tarfile-unsafe-extraction
        tar.extract(member, dest)


def unsafe_downloaded_cache(url, dest):
    # models CVE-2026-43637: extracting an untrusted downloaded archive
    local = download(url)
    with tarfile.open(local) as tar:
        # ruleid: tarfile-unsafe-extraction
        tar.extractall(dest)


# ----- safe: extraction filter present (Python 3.12+) -----

def safe_data_filter(archive_path, dest):
    with tarfile.open(archive_path) as tar:
        # ok: tarfile-unsafe-extraction
        tar.extractall(dest, filter="data")


def safe_data_filter_symbol(archive_path, dest):
    with tarfile.open(archive_path) as tar:
        # ok: tarfile-unsafe-extraction
        tar.extractall(path=dest, filter=tarfile.data_filter)


def safe_member_filter(archive_path, dest, member):
    with tarfile.open(archive_path) as tar:
        # ok: tarfile-unsafe-extraction
        tar.extract(member, dest, filter="tar")


def safe_chained_filter(archive_path, dest):
    # ok: tarfile-unsafe-extraction
    tarfile.open(archive_path).extractall(dest, filter="data")


# ----- safe: not a tarfile object (zipfile sanitizes '..' since 2.7.4) -----

def zip_extract(archive_path, dest):
    with zipfile.ZipFile(archive_path) as zf:
        # ok: tarfile-unsafe-extraction
        zf.extractall(dest)


# ----- typed helper parameter (archive opened by the caller) -----

def unsafe_typed_helper(tar: tarfile.TarFile, dest):
    # ruleid: tarfile-unsafe-extraction
    tar.extractall(dest)


from tarfile import TarFile

def unsafe_typed_helper_bare(tar: TarFile, dest, member):
    # ruleid: tarfile-unsafe-extraction
    tar.extract(member, dest)


def safe_typed_helper(tar: tarfile.TarFile, dest):
    # ok: tarfile-unsafe-extraction
    tar.extractall(dest, filter="data")
