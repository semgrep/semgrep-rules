import multiprocessing
import multiprocessing.connection


rx = multiprocessing.connection.Client(('localhost', 12345)).recv()

# ruleid: multiprocessing-recv
connection = multiprocessing.connection.Client(
    ('localhost', 12345),
)

output = {}
connection.send(output)

# todoruleid:multiprocessing-recv
rx = connection.recv()
