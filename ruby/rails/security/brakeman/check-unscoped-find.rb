class GroupsController < ApplicationController

  def show
    #ruleid: check-unscoped-find
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  def show_ok
    #ok: check-unscoped-find
    @user = User.find(session[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  def show_ok2
    #ok: check-unscoped-find
    current_user = User.find(session[:id])
    #ok: check-unscoped-find
    current_user.accounts.find(param[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  def get
    #ruleid: check-unscoped-find
    @some_record = SomeRecord.find_by_id!(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

end
