import multiprocessing
import multiprocessing.connection

connection = multiprocessing.connection.Client(
    ('localhost', 12345),
)

output = {}
connection.send(output)

# toodoruleid:multiprocessing.recv
rx = connection.recv()
