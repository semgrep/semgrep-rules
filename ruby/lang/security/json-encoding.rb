 def bad_json_encoding
     params[:User].to_json
     JSON.encode(params[:User]).html_safe
 end

 def ok_xml
     "hello".to_json
 end
