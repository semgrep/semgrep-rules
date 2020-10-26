require 'openuri'

def bad1
  # ruleid: openuri-request
  URI.open("http://www.ruby-lang.org/en") {|f|
    f.each_line {|line| p line}
    p f.base_uri         # <URI::HTTP:0x40e6ef2 URL:http://www.ruby-lang.org/en/>
    p f.content_type     # "text/html"
    p f.charset          # "iso-8859-1"
    p f.content_encoding # []
    p f.last_modified    # Thu Dec 05 02:45:02 UTC 2002
  }
end

def bad2
  # ruleid: openuri-request
  uri = URI.parse("http://www.ruby-lang.org/en/")
  uri.open {|f|
    # ...
  }
end

def bad3
  # ruleid: openuri-request
  URI.open("ftp://www.ruby-lang.org/en") {|f|
    # stuff
  }
end

def bad4
  # ruleid: openuri-request
  uri = URI.parse("ftp://www.ruby-lang.org/en/")
  uri.open {|f|
    # ...
  }
end

def ok1
  # ok: openuri-request
  URI.open("https://www.ruby-lang.org/en") {|f|
    f.each_line {|line| p line}
    p f.base_uri         # <URI::HTTP:0x40e6ef2 URL:http://www.ruby-lang.org/en/>
    p f.content_type     # "text/html"
    p f.charset          # "iso-8859-1"
    p f.content_encoding # []
    p f.last_modified    # Thu Dec 05 02:45:02 UTC 2002
  }
end

def ok2
  # ok: openuri-request
  uri = URI.parse("https://www.ruby-lang.org/en/")
  uri.open {|f|
    # ...
  }
end

def ok3
  # ok: openuri-request
  URI.open("sftp://www.ruby-lang.org/en") {|f|
    # stuff
  }
end

def ok4
  # ok: openuri-request
  uri = URI.parse("sftp://www.ruby-lang.org/en/")
  uri.open {|f|
    # ...
  }
end
