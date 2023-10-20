def bad(input_string):
    # ok: use-defused-xml-parse
    import xml
    # ok: use-defused-xml-parse
    from xml.etree import ElementTree
    tree = ElementTree.parse('country_data.xml')
    root = tree.getroot()

    # ruleid: use-defused-xml-parse
    tree = ElementTree.parse(input_string)

def ok():
    # ok: use-defused-xml-parse
    import defusedxml
    # ok: use-defused-xml-parse
    from defusedxml.etree import ElementTree
    tree = ElementTree.parse('country_data.xml')
    root = tree.getroot()

    # ok: use-defused-xml-parse
    tree = ElementTree.parse(input_string)
