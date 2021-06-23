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
    with tempfile.NamedTemporaryFile("w") as fout:
        debug_print(astr)
        fout.write(astr)
        debug_print('wrote file')

        # ruleid:tempfile-without-flush
        cmd = [binary_name, fout.name, *[str(path) for path in targets]]


def main_d():
    fout = tempfile.NamedTemporaryFile('w')
    debug_print(astr)
    fout.write(astr)

    # ruleid:tempfile-without-flush
    fout.name
    # ruleid:tempfile-without-flush
    cmd = [binary_name, fout.name, *[str(path) for path in targets]]


def main_e():
    fout = tempfile.NamedTemporaryFile('w')
    debug_print(astr)
    fout.write(astr)

    # ruleid:tempfile-without-flush
    print(fout.name)
    # ruleid:tempfile-without-flush
    cmd = [binary_name, fout.name, *[str(path) for path in targets]]


def main_f():
    fout = tempfile.NamedTemporaryFile('w', delete=False)
    debug_print(astr)
    fout.close()

    # ok:tempfile-without-flush
    print(fout.name)

def main_g(language, rule, target_manager, rule):
    with tempfile.NamedTemporaryFile(
        "w", suffix=".yaml"
    ) as rule_file, tempfile.NamedTemporaryFile("w") as target_file:
        targets = self.get_files_for_language(language, rule, target_manager)
        target_file.write("\n".join(map(lambda p: str(p), targets)))
        target_file.flush()
        yaml = YAML()
        yaml.dump({"rules": [rule._raw]}, rule_file)
        rule_file.flush()

        cmd = [SEMGREP_PATH] + [
            "-lang",
            language,
            "-fast",
            "-json",
            "-config",
            # ok: tempfile-without-flush
            rule_file.name
        ]
