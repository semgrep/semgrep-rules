import sh

long = os.environ.get("LONG", "")
# ruleid: string-concat
sh.ls("-a" + long)

# ok: string-concat
sh.ls("-al")

# ok: string-concat
sh.semgrep("--config", "https://semgrep.dev/p/r2c-CI")

confurl = os.environ.get("SEMGREP_CONFIG_URL", "")
# ruleid: string-concat
sh.semgrep("--config {}".format(confurl))

# ruleid: string-concat
sh.semgrep(f"--config {confurl}")

# ok: string-concat
args = ["--config", confurl]
sh.semgrep(*args)
