import csv
import flask
import io

from data import get_data
from util import chroot

app = flask.Flask(__name__)

@app.route("a/<title>")
def a(title):
    stream = io.StringIO()
    writer = csv.writer(stream)
    data = get_data()
    title_row = title + ("," * len(data[0]) - 1)
    # ruleid: csv-writer-injection
    writer.writerow(title_row)
    writer.writerows(data)
    stream.flush()
    stream.seek(0)
    return stream.read()

@app.route("ok")
def ok():
    with open("data.csv") as fin:
        # ok: csv-writer-injection
        reader = csv.reader(fin)
        lines = [line for line in reader]
    return '\n'.join(lines)
