import xml
from xml.etree import ElementTree 
tree = ElementTree.parse('country_data.xml')
root = tree.getroot()