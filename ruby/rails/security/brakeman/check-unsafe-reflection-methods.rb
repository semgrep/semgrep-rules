class GroupsController < ApplicationController

  def dynamic_method_invocations
    # ruleid: check-unsafe-reflection-methods
    params[:method].to_sym.to_proc.call(Kernel)
    # ruleid: check-unsafe-reflection-methods
    (params[:klass].to_s).method(params[:method]).(params[:argument])
    # ruleid: check-unsafe-reflection-methods
    Kernel.tap(&params[:method].to_sym)
    User.method("#{User.first.some_method_thing}_stuff")
    user_input_value = params[:my_user_input]
    # ruleid: check-unsafe-reflection-methods
    anything.tap(&user_input_value.to_sym)
    # ruleid: check-unsafe-reflection-methods
    anything_else.tap { |thing| thing + user_input_value() }
  end

  def dynamic_method_invocations_ok
    # ok: check-unsafe-reflection-methods
    "SomeClass".to_sym.to_proc.call(Kernel)
    # ok: check-unsafe-reflection-methods
    SomeClass.method("some_method").("some_argument")
    # ok: check-unsafe-reflection-methods
    Kernel.tap("SomeClass".to_sym)
    user_input_value = params[:my_user_input]
    # ok: check-unsafe-reflection-methods
    user_input_value.tap("some_method")
  end

end
