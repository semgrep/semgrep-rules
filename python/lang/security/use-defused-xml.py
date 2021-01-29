def bad():
    # ruleid: use-defused-xml
    import xml
    # ruleid: use-defused-xml
    from xml.etree import ElementTree
    tree = ElementTree.parse('country_data.xml')
    root = tree.getroot()

def ok():
    # ok: use-defused-xml
    import defusedxml
    # ok: use-defused-xml
    from defusedxml.etree import ElementTree
    tree = ElementTree.parse('country_data.xml')
    root = tree.getroot()
