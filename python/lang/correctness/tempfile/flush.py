import tempfile

import at
import tf


def main():
    with tempfile.NamedTemporaryFile("w") as fout:
        debug_print(astr)
        fout.write(astr)
        # ok:tempfile-without-flush
        fout.flush()
        cmd = [binary_name, fout.name, *[str(path) for path in targets]]


def main_b():
    with tempfile.NamedTemporaryFile("w") as fout:
        debug_print(astr)
        fout.write(astr)
        # ok:tempfile-without-flush
        fout.close()
        cmd = [binary_name, fout.name, *[str(path) for path in targets]]


def main_c():
    with tempfile.NamedTemporaryFile("w") as fout:
        debug_print(astr)
        fout.write(astr)

    # ok:tempfile-without-flush
    cmd = [binary_name, fout.name, *[str(path) for path in targets]]


def main_c():
    # ruleid:tempfile-without-flush
    with tempfile.NamedTemporaryFile("w") as fout:
        debug_print(astr)
        fout.write(astr)
        debug_print('wrote file')

        cmd = [binary_name, fout.name, *[str(path) for path in targets]]


def main_d():
    # ruleid:tempfile-without-flush
    fout = tempfile.NamedTemporaryFile('w')
    debug_print(astr)
    fout.write(astr)

    fout.name
    cmd = [binary_name, fout.name, *[str(path) for path in targets]]


def main_e():
    # ruleid:tempfile-without-flush
    fout = tempfile.NamedTemporaryFile('w')
    debug_print(astr)
    fout.write(astr)

    print(fout.name)
    cmd = [binary_name, fout.name, *[str(path) for path in targets]]
