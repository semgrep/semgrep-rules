class Bad_cookie_serialization
  # ruleid: cookie-serialization
  Rails.application.config.action_dispatch.cookies_serializer = :hybrid
  # ruleid: cookie-serialization
  Rails.application.config.action_dispatch.cookies_serializer = :marshal
end

class Cookie_serialization
  # ok.
  Rails.application.config.action_dispatch.cookies_serializer = :json
end
