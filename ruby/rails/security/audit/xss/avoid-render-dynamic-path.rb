#ruleid: avoid-render-dynamic-path
render(action => params[:action], {})

#ruleid: avoid-render-dynamic-path
render(action => cookies[:name], {})

#ruleid: avoid-render-dynamic-path
render(action => h(request.env['HTTP_REFERRER']), {})

#ruleid: avoid-render-dynamic-path
render(template => foo(request.env['HTTP_REFERRER']), {})

#ok: avoid-render-dynamic-path
render(inline => params[:action], {})

#ok: avoid-render-dynamic-path
render(action => my_action, {})

#ok: avoid-render-dynamic-path
render(my_json)
