import csv

with open("file", 'r') as fin:
    # ok: use-defusedcsv
    reader = csv.reader(fin)

with open("file", 'w') as fout:
    # ruleid: use-defusedcsv
    writer = csv.writer(fout, quoting=csv.QUOTE_ALL)

import defusedcsv as csv

with open("file", 'w') as fout:
    # ok: use-defusedcsv
    writer = csv.writer(fout)
