class BaseController < ActionController::Base
  def test_redirect
    params[:action] = :index
    #ruleid: check-redirect-to
    redirect_to params
  end

  def redirect_to_strong_params
    # ruleid: check-redirect-to
    redirect_to params.permit(:domain) # should warn
    # ok: check-redirect-to
    redirect_to params.permit(:page, :sort) # should not warn
    # ok: check-redirect-to
    redirect_to [params.permit(:domain)]
  end

  def test_only_path_wrong
    # ruleid: check-redirect-to
    redirect_to params[:user], :only_path => true #This should still warn
  end
  def test_only_path_correct
    params.merge! :only_path => true
    # ok: check-redirect-to
    redirect_to params
  end

  def wrong_redirect_only_path
    # ruleid: check-redirect-to
    redirect_to(params.bla.merge(:only_path => true, :display => nil))
  end

  def redirect_only_path_with_unsafe_hash
    # ok: check-redirect-to
    redirect_to(params.to_unsafe_hash.merge(:only_path => true, :display => nil))
  end

  def redirect_only_path_with_unsafe_h
    # ok: check-redirect-to
    redirect_to(params.to_unsafe_h.merge(:only_path => true, :display => nil))
  end
end
