import os

# ruleid: python37-compatibility-importlib2
import importlib.resources

# ruleid: python37-compatibility-importlib3
import importlib.abc.ResourceReader

# ruleid:python37-compatibility-importlib
importlib.source_hash()

# ruleid: python37-compatibility-httpconn
http.client.HTTPConnection(blocksize=5,var, etc)

# ruleid: python37-compatibility-textiowrapper
TextIOWrapper.reconfigure(var)

# ruleid: python37-compatibility-ipv6network1
ipaddress.IPv6Network.subnet_of(ip)

# ruleid: python37-compatibility-ipv6network2
ipaddress.IPv6Network.supernet_of(ip)

# ruleid: python37-compatibility-ipv4network1
ipaddress.IPv4Network.subnet_of(ip)

# ruleid: python37-compatibility-ipv4network2
ipaddress.IPv4Network.supernet_of(ip)

# ruleid: python37-compatibility-locale1
locale.format_string(monetary=var, extravars)

# ruleid: python37-compatibility-math1
math.remainder(24, 3)

# ruleid: python37-compatibility-multiprocess1
multiprocessing.Process.close()

# ruleid: python37-compatibility-multiprocess2
multiprocessing.Process.kill()

# ruleid: python37-compatibility-os1
os.preadv(var)

# ruleid: python37-compatibility-pdb
pdb.set_trace(header=header, stuffa)


if hasattr(os, 'pwrite'):
    # OK
    os.pwrite('a')


if hasattr(os, 'pwritev'):
    # OK
    os.pwritev('a')


# ruleid:python37-compatibility-os2-ok2
os.pwritev('b')
