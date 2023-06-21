include ActiveSupport

 def bad_xml
     XmlMini.backend = 'JDOM'

     XmlMini.backend = 'LibXMLSAX'
 end

 def ok_xml
     XmlMini.backend = 'REXML'
 end
