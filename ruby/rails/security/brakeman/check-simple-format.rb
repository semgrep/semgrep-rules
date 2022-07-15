def bad1(param)
  # ruleid: check-simple-format
  simple_format(some_text, class:params[:class])
end

def bad2()
   percentage_of_goal = params[:goal]
   # ruleid: check-simple-format
   simple_format(
      "Success! We're making the world better!\n
      #{percentage_of_goal}% funded"
    )
end

def ok1(param)
  # ok: check-simple-format
  simple_format(some_text, h(class:params[:class]))
end

def ok2
   percentage_of_goal = html_escape(params[:goal])
   # ok: check-simple-format
   simple_format(
      "Success! We're making the world better!\n
      #{percentage_of_goal}% funded"
    )
end
