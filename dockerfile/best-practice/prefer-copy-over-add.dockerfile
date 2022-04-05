FROM busybox

# ruleid: prefer-copy-over-add
ADD foo bar

# ruleid: prefer-copy-over-add
ADD foo* /mydir/

# ruleid: prefer-copy-over-add
ADD hom?.txt /mydir/o

# ruleid: prefer-copy-over-add
ADD arr[[]0].txt /mydir/o

# ruleid: prefer-copy-over-add
ADD --chown=55:mygroup files* /somedir/

# ruleid: prefer-copy-over-add
ADD --chown=bin files* /somedir/
