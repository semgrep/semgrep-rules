class CachingController < ApplicationController
  # ruleid: rails-check-page-caching-cve
  caches_page :show
end

class SafeController < ApplicationController
  # ruleid: ok
  asdf :show
end

