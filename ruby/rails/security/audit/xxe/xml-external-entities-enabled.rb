require 'xml'
require 'libxml'

# Change the ActiveSupport XML backend from REXML to LibXML
ActiveSupport::XmlMini.backend = 'LibXML'

LibXML::XML.class_eval do
  def self.default_substitute_entities
    # ruleid: xml-external-entities-enabled
    XML.default_substitute_entities = true
  end
end

LibXML::XML.class_eval do
  def self.default_substitute_entities
    # ok: xml-external-entities-enabled
    XML.default_substitute_entities = false
  end
end
