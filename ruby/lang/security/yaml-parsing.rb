# cf. https://github.com/presidentbeef/brakeman/blob/v3.6.2/test/apps/rails_with_xss_plugin/config/initializers/yaml_parsing.rb

ActionController::Base.param_parsers[Mime::YAML] = :yaml

ActiveSupport::CoreExtensions::Hash::Conversions::XML_PARSING.delete('symbol')
ActiveSupport::CoreExtensions::Hash::Conversions::XML_PARSING.delete('yaml')
