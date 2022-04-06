class HomeController < ApplicationController

  def unsafe_reflection # not that safe
    table = params["table"]
    # ruleid: check-unsafe-reflection
    model = table.classify.constantize
    @result = model.send(:method)
  end

  # safe
  def ok_reflection
    foo = "SomeClass"
    #ok: check-unsafe-reflection
    foo.classify.constantize
  end

  def test_more_send_methods
    User.try(params[:meth])
    self.__send__(params[:meth])
    Account.public_send(params[:meth])

    table = params["table"]
    # ruleid: check-unsafe-reflection
    table.classify.constantize.try(:meth)
  end

end