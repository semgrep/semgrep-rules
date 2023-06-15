def bad(string, symbol, mime_type_synonyms = [], extension_synonyms = [], skip_lookup = false)
  Mime.const_set(symbol.to_s.upcase, Type.new(string, symbol, mime_type_synonyms))
end

def ok()
  Mime.const_set :LOOKUP, Hash.new { |h,k|
    Mime::Type.new(k) unless k.blank?
  }
end
