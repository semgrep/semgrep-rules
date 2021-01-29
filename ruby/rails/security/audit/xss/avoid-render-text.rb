# cf. https://github.com/rails/rails/blob/939fe523126198d43ecedeacc05dd7fdb1eae3d9/actionpack/test/controller/action_pack_assertions_test.rb


# frozen_string_literal: true

require "abstract_unit"
require "controller/fake_controllers"

class ActionPackAssertionsController < ActionController::Base
  def nothing() head :ok end

  # ok: avoid-render-text
  def hello_xml_world() render template: "test/hello_xml_world"; end

  def assign_this
    @howdy = "ho"
    render inline: "Mr. Henke"
  end

  def render_based_on_parameters
    # ok: avoid-render-text
    render plain: "Mr. #{params[:name]}"
  end

  def render_url
    # ok: avoid-render-text
    render html: "<div>#{url_for(action: 'flash_me', only_path: true)}</div>"
  end

  def render_text_with_custom_content_type
    # ok: avoid-render-text
    render body: "Hello!", content_type: Mime[:rss]
  end

  def session_stuffing
    session["xmas"] = "turkey"
    # ruleid: avoid-render-text
    render text: "ho ho ho"
  end

  def raise_exception_on_get
    raise "get" if request.get?
    # ruleid: avoid-render-text
    render text: "request method: #{request.env['REQUEST_METHOD']}"
  end

  def raise_exception_on_post
    raise "post" if request.post?
    # ok: avoid-render-text
    render plain: "request method: #{request.env['REQUEST_METHOD']}"
  end

  def render_file_absolute_path
    # ok: avoid-render-text
    render file: File.expand_path("../../README.rdoc", __dir__)
  end

  def render_file_relative_path
    # ok: avoid-render-text
    render file: "README.rdoc"
  end
end

# Used to test that assert_response includes the exception message
# in the failure message when an action raises and assert_response
# is expecting something other than an error.
class AssertResponseWithUnexpectedErrorController < ActionController::Base
  def index
    raise "FAIL"
  end

  def show
    # ok: avoid-render-text
    render plain: "Boom", status: 500
  end
end
