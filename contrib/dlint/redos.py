def sanitize_css(self, style):
    # ruleid: dlint-catastrophic-redos
    gauntlet = re.compile(
        r"""^([-/:,#%.'"\s!\w]|\w-\w|'[\s\w]+'\s*|"[\s\w]+"|\([\d,%\.\s]+\))*$""",
        flags=re.U
    )

    for part in parts:
        if not gauntlet.match(part):
            return ''

    # ok: dlint-catastrophic-redos
    safe = re.compile(r""".*""")
    print(safe.match("foo"))
