class CachingController < ApplicationController
  caches_page :show
end

class CachingController2 < ApplicationController
  caches_page :uhoh
end

class SafeController < ApplicationController
  asdf :show
end

