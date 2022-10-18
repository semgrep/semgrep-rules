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

  def test_param_ok
    map = make_map
    thing = map[params.id]
    # ok: check-render-local-file-include
    render :file => "/some/path/#{thing}"
  end
    
