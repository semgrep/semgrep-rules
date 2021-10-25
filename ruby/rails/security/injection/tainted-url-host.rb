# cf. https://github.com/rails/rails/blob/939fe523126198d43ecedeacc05dd7fdb1eae3d9/actionpack/test/controller/action_pack_assertions_test.rb

# frozen_string_literal: true

require "abstract_unit"
require "controller/fake_controllers"
require "ssrf_filter"

class ActionPackAssertionsController < ActionController::Base
  def nothing() head :ok end

  # ok: tainted-url-host
  def hello_xml_world() render template: "test/hello_xml_world"; end

  def assign_this
    @howdy = "ho"
    # ok: tainted-url-host
    render inline: "Mr. Henke"
  end

  def render_based_on_parameters
    # ok: tainted-url-host
    render plain: "Mr. #{params[:name]}"
  end

  def render1
    # ruleid: tainted-url-host
    render inline: "<a href='http://#{params[:name]}/path'></div>"
  end

  def render2
    # ruleid: tainted-url-host
    render inline: "<a href='https://%s/path'></div>" % params[:name]
  end

  def render3
    name = params[:name]
    # ruleid: tainted-url-host
    render inline: "https://%s/%s" % name, "blah"
  end

  def render4
    name = params[:name]
    # ruleid: tainted-url-host
    render inline: Kernel::sprintf("ws://%s", name)
  end

  def render_boo
    # ok: tainted-url-host
    render html: "boo, %s" % params[:name]
  end

  def raise_exception_on_post_ok
    raise "post" if request.post?
    # ok: tainted-url-host
    render plain: strip_tags("<h1>request method: %s</h1>" % request.env['REQUEST_METHOD'])
  end

  def raise_exception_on_post_ok2
    raise "post" if request.post?
    # ok: tainted-url-host
    render plain: sanitize("<h1>request method: %s</h1>" % request.env['REQUEST_METHOD'])
  end

  def sanitized
    # ok: tainted-url-host
    response = SsrfFilter.get(params[:url])
    response
  end
end
