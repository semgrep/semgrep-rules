FROM busybox

# ruleid: prefer-copy-over-add
ADD http://foo bar

# ruleid: prefer-copy-over-add
ADD https://foo bar

# ruleid: prefer-copy-over-add
ADD foo.tar.gz bar

# ruleid: prefer-copy-over-add
ADD foo.bz2 bar

# ok: prefer-copy-over-add
ADD foo bar

# ok: prefer-copy-over-add
ADD foo* /mydir/

# ok: prefer-copy-over-add
ADD hom?.txt /mydir/o

# ok: prefer-copy-over-add
ADD arr[[]0].txt /mydir/o

# ok: prefer-copy-over-add
ADD --chown=55:mygroup files* /somedir/

# ok: prefer-copy-over-add
ADD --chown=bin files* /somedir/
