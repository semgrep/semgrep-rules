import csv

csv.writer(csvfile, delimiter=',', quotechar='"')
csv.writer(csvfile, delimiter=',', quotechar='"', quoting=csv.QUOTE_ALL)
csv.writer(csvfile, delimiter=',', quotechar='"', quoting=1)
csv.writer(csvfile, dialect='unix')
csv.writer(csvfile, dialect=csv.unix_dialect)
