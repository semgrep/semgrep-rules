 def bad_json_encoding
     # ruleid: json-encoding
     params[:User].to_json
     # ruleid: json-encoding
     JSON.encode(params[:User]).html_safe
 end

 def ok_xml
     # ok: json-encoding
     "hello".to_json
 end
