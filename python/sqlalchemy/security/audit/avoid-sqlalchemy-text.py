from sqlalchemy import text

# ruleid: avoid-sqlalchemy-text
text(5)

# ok
text("5")

# ok
text(":n").bindparams(n=5)