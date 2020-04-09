import marshal

fin = db.open('index.mar')
for line in fin:
    # ruleid: marshal-usage
    marshal.dumps(line)
