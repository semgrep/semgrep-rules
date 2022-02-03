class Text < ApplicationController
  # ruleid: rails-check-render-dos
  render :hello
end

class Text < ApplicationController
  # ok
  send :hello
end

