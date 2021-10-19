# cf. https://github.com/rails/rails/blob/939fe523126198d43ecedeacc05dd7fdb1eae3d9/actionpack/test/controller/action_pack_assertions_test.rb

# frozen_string_literal: true

require "abstract_unit"
require "controller/fake_controllers"

class ActionPackAssertionsController < ActionController::Base
  def nothing() head :ok end

  # ok: raw-html-format
  def hello_xml_world() render template: "test/hello_xml_world"; end

  def assign_this
    @howdy = "ho"
    # ok: raw-html-format
    render inline: "Mr. Henke"
  end

  def render_based_on_parameters
    # ok: raw-html-format
    render plain: "Mr. #{params[:name]}"
  end

  def render1
    # ruleid: raw-html-format
    render inline: "<div>#{params[:name]}</div>"
  end

  def render2
    # ruleid: raw-html-format
    render inline: "<div>%s</div>" % params[:name]
  end

  def render3
    name = params[:name]
    # ruleid: raw-html-format
    render inline: "<div>%s, %s</div>" % name, "blah"
  end

  def render_url
    name = params[:name]
    # ruleid: raw-html-format
    render inline: Kernel::sprintf("<div>%s</div>", name)
  end

  def render_url
    # ok: raw-html-format
    render html: "boo, %s" % params[:name]
  end

  def raise_exception_on_get
    raise "get" if request.get?
    # ruleid: raw-html-format
    render text: "<h1>request method: #{request.env['REQUEST_METHOD']}</h1>"
  end

  def raise_exception_on_post
    raise "post" if request.post?
    # ruleid: raw-html-format
    render plain: "<h1>request method: %s</h1>" % request.env['REQUEST_METHOD']
  end

  def raise_exception_on_post_ok
    raise "post" if request.post?
    # ok: raw-html-format
    render plain: strip_tags("<h1>request method: %s</h1>" % request.env['REQUEST_METHOD'])
  end

  def raise_exception_on_post_ok2
    raise "post" if request.post?
    # ok: raw-html-format
    render plain: sanitize("<h1>request method: %s</h1>" % request.env['REQUEST_METHOD'])
  end
end
