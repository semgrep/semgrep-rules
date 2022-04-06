# From https://www.paulsprogrammingnotes.com/2021/12/python-memory-leaks.html

# naive case
sock = socket.socket(af, socktype, proto)

try:
    # ruleid: socket-shutdown-close
    sock.shutdown(socket.SHUT_RDWR)
    sock.close()
except OSError:
    pass

try:
    # ok: socket-shutdown-close
    sock.shutdown(socket.SHUT_RDWR)
except OSError:
    pass

try:
    sock.close()
except OSError:
    pass


# other variable name
other_name = socket.socket(af, socktype, proto)

try:
    # ruleid: socket-shutdown-close
    other_name.shutdown(socket.SHUT_RDWR)
    other_name.close()
except OSError:
    pass

try:
    # ok: socket-shutdown-close
    other_name.shutdown(socket.SHUT_RDWR)
except OSError:
    pass

try:
    other_name.close()
except OSError:
    pass


# different argument to shutdown(...)
from socket import SHUT_WR
sock = socket.socket(af, socktype, proto)

try:
    # ruleid: socket-shutdown-close
    sock.shutdown(SHUT_WR)
    sock.close()
except OSError:
    pass

try:
    # ok: socket-shutdown-close
    sock.shutdown(SHUT_WR)
except OSError:
    pass

try:
    sock.close()
except OSError:
    pass

# non-socket object

# ok: socket-shutdown-close
logging.shutdown()
logging.close()

# close is called after all
sock = socket.socket(af, socktype, proto)

try:
    # ok: socket-shutdown-close
    sock.shutdown(socket.SHUT_RDWR)
    sock.close()
except OSError:
    sock.close()

try:
    # ok: socket-shutdown-close
    sock.shutdown(socket.SHUT_RDWR)
    sock.close()
    pass
except OSError:
    pass
    sock.close()
    pass

try:
    # ok: socket-shutdown-close
    sock.shutdown(socket.SHUT_RDWR)
    sock.close()
except:
    sock.close()

try:
    # ok: socket-shutdown-close
    sock.shutdown(socket.SHUT_RDWR)
    sock.close()
finally:
    sock.close()
