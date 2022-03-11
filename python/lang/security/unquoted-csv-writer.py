import csv

# ruleid:unquoted-csv-writer
csv.writer(csvfile, delimiter=',', quotechar='"')
# ok:unquoted-csv-writer
csv.writer(csvfile, delimiter=',', quotechar='"', quoting=csv.QUOTE_ALL)
# ok:unquoted-csv-writer
csv.writer(csvfile, delimiter=',', quotechar='"', quoting=1)
# ok:unquoted-csv-writer
csv.writer(csvfile, dialect='unix')
# ok:unquoted-csv-writer
csv.writer(csvfile, dialect=csv.unix_dialect)
