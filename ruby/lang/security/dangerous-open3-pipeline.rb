require 'open3'

fname = "/usr/share/man/man1/ruby.1.gz"
# ok:dangerous-open3-pipeline
p Open3.pipeline(["zcat", fname], "nroff -man", "less")

fname = "/usr/share/man/man1/ls.1.gz"
# ok:dangerous-open3-pipeline
Open3.pipeline(["zcat", fname], "nroff -man", "colcrt")

# ok:dangerous-open3-pipeline
Open3.pipeline("sort", "uniq -c", :in=>"names.txt", :out=>"count")

r,w = IO.pipe
w.print "ibase=14\n10\n"
# ok:dangerous-open3-pipeline
Open3.pipeline("bc", "tee /dev/tty", :in=>r, :out=>w)

pdf_file = "paper.pdf"
# ruleid:dangerous-open3-pipeline
Open3.pipeline(["pdftops", pdf_file, "-"], ["lpr", "-P#{user_input}"])
