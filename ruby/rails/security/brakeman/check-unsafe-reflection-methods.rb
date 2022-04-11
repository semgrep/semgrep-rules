class GroupsController < ApplicationController

  def dynamic_method_invocations
    # ruleid: check-unsafe-reflection-methods
    params[:method].to_sym.to_proc.call(Kernel)
    # ruleid: check-unsafe-reflection-methods
    (params[:klass].to_s).method(params[:method]).(params[:argument])
    # ruleid: check-unsafe-reflection-methods
    Kernel.tap(&params[:method].to_sym)
    User.method("#{User.first.some_method_thing}_stuff")
  end

  def dynamic_method_invocations_ok
    # ok: check-unsafe-reflection-methods
    "SomeClass".to_sym.to_proc.call(Kernel)
    # ok: check-unsafe-reflection-methods
    SomeClass.method("some_method").("some_argument")
    # ok: check-unsafe-reflection-methods
    Kernel.tap("SomeClass".to_sym)
  end

end
