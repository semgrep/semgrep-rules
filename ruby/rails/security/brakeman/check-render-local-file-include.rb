  def test_render
    @some_variable = params[:unsafe_input]
    # ok: check-render-local-file-include
    render :index
  end

  def test_dynamic_render
    page = params[:page]
    #ruleid: check-render-local-file-include
    render :file => "/some/path/#{page}"
  end

  def test_render_with_modern_param
    page = params[:page]
    #ruleid: check-render-local-file-include
    render file: "/some/path/#{page}"
  end

  def test_render_with_modern_param_second_param
    page = params[:page]
    #ruleid: check-render-local-file-include
    render status: 403, file: "/some/path/#{page}"
  end

  def test_render_with_old_param_second_param
    page = params[:page]
    #ruleid: check-render-local-file-include
    render :status => 403, :file => "/some/path/#{page}"
  end

  def test_render_with_first_positional_argument
    page = params[:page]
    #ruleid: check-render-local-file-include
    render page
  end

  def test_render_with_first_positional_argument_and_keyword
    page = params[:page]
    #ruleid: check-render-local-file-include
    render page, status: 403
  end

  def test_param_ok
    map = make_map
    thing = map[params.id]
    # ok: check-render-local-file-include
    render :file => "/some/path/#{thing}"
  end
    

