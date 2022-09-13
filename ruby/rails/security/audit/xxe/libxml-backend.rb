# cf. https://www.stackhawk.com/blog/rails-xml-external-entities-xxe-guide-examples-and-prevention/

require 'xml'
require 'libxml'

# ruleid: libxml-backend
ActiveSupport::XmlMini.backend = 'LibXML'

# ok: libxml-backend
ActiveSupport::XmlMini.backend = 'REXML'

# ok: libxml-backend
ActiveSupport::XmlMini.backend = 'Nokogiri'

# Deny entity replacement in LibXML parsing
LibXML::XML.class_eval do
  def self.default_substitute_entities
    XML.default_substitute_entities = false
  end
end
