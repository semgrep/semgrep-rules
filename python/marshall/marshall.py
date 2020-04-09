import marshal

fin = db.open('index.mar')
for line in fin:
    # todo: marshal-usage
    marshal.dumps(line)
