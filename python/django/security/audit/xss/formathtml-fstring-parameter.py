from django.utils.html import format_html

planet = "world"
markup = "<marquee>" + planet

#############################################################

# ok: formathtml-fstring-parameter
print(format_html("hello {}", markup))
# ok: formathtml-fstring-parameter
print(format_html("hello {}", "<marquee>world"))
# ok: formathtml-fstring-parameter
print(format_html("hello {}", "<marquee>" "world"))
# ok: formathtml-fstring-parameter
print(format_html("hello {}", "<marquee>" + "world"))
# ok: formathtml-fstring-parameter
print(format_html("hello {}", f"<marquee>{planet}"))
# ok: formathtml-fstring-parameter
print(format_html("hello {}", "<marquee>%s" % planet))
# ok: formathtml-fstring-parameter
print(format_html("hello {}", "<marquee>{}".format(planet)))
# ok: formathtml-fstring-parameter
print(format_html("hello " "{}", "<marquee>world"))
# ok: formathtml-fstring-parameter
print(format_html("hello " + "{}", "<marquee>world"))

#############################################################

# ruleid: formathtml-fstring-parameter
print(format_html("hello %s" % markup))
# ruleid: formathtml-fstring-parameter
print(format_html(f"hello {markup}"))
# ruleid: formathtml-fstring-parameter
print(format_html("hello {}".format(markup)))
# ruleid: formathtml-fstring-parameter
print(format_html("hello %s {}" % markup, markup))
# ruleid: formathtml-fstring-parameter
print(format_html(f"hello {markup} {{}}", markup))
# ruleid: formathtml-fstring-parameter
print(format_html("hello {} {{}}".format(markup), markup))
