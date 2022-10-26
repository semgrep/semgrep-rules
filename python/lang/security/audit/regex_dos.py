import re

redos = r"^(a+)+$"
regex = r"^[0-9]+$"

data = "foo"

# ruleid: regex_dos
pattern = re.compile(redos)
pattern.search(data)

# ok: regex_dos
pattern = re.compile(regex)
pattern.search(data)

# ruleid: regex_dos
pattern = re.compile(redos)
pattern.match(data)

# ok: regex_dos
pattern = re.compile(regex)
pattern.fullmatch(data)

# ok: regex_dos
pattern = re.compile(regex)
pattern.split(data)

# ruleid: regex_dos
pattern = re.compile(redos)
pattern.findall(data)

# ok: regex_dos
pattern.escape(redos)

# ok: regex_dos
pattern = re.compile(redos)
pattern.purge()