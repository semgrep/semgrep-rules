class UsersController < ApplicationController
  skip_before_action :has_info
  skip_before_action :authenticated, only: [:new, :create]

  def new
    @user = User.new
  end


  def update1
    message = false
    # ruleid:tainted-sql-string
    user = User.find(:first, :conditions => "user_id = '#{params[:user][:user_id]}'")
    user.skip_user_id_assign = true
    user.update_attributes(params[:user].reject { |k| k == ("password" || "password_confirmation") || "user_id" })
    pass = params[:user][:password]
    user.password = pass if !(pass.blank?)
    message = true if user.save!
    respond_to do |format|
      format.html { redirect_to user_account_settings_path(:user_id => current_user.user_id) }
      format.json { render :json => {:msg => message ? "success" : "false "} }
    end
  end


  def update2
    message = false

    # ruleid:tainted-sql-string
    user = User.where("user_id = '#{params[:user][:id]}'")[0]

    if user
      user.update_attributes(user_params_without_password)
      if params[:user][:password].present? && (params[:user][:password] == params[:user][:password_confirmation])
        user.password = params[:user][:password]
      end
      message = true if user.save!
      respond_to do |format|
        format.html { redirect_to user_account_settings_path(user_id: current_user.id) }
        format.json { render json: {msg: message ? "success" : "false "} }
      end
    else
      flash[:error] = "Could not update user!"
      redirect_to user_account_settings_path(user_id: current_user.id)
    end
  end

  def test3
    # ruleid:tainted-sql-string
    records = ActiveRecord::Base.connection.execute("INSERT INTO person (name) VALUES ('%s')" % params[:user])
    redirect_to '/'
  end

  def test4
    # ruleid:tainted-sql-string
    records = ActiveRecord::Base.connection.execute(Kernel::sprintf("SELECT FROM person WHERE name='%s'", params[:user]))
    redirect_to '/'
  end

  def test5
    # ruleid:tainted-sql-string
    records = ActiveRecord::Base.connection.execute("SELECT FROM person WHERE name='" + params[:user] + "'")
    redirect_to '/'
  end

  def ok_test1
    # ok:tainted-sql-string
    message = "this is just a message ! %s" % params[:user]
    redirect_to '/'
  end

  def ok_test2
    # ok:tainted-sql-string
    message = Kernel::sprintf("this message is ok: '%s'", params[:user])
    redirect_to '/'
  end

  def ok_test3
    # ok:tainted-sql-string
    records = "this is ok!" + params[:user] + "'"
    redirect_to '/'
  end

  def ok_test4
    # ok:tainted-sql-string
    user = User.where("user_id = ?", "#{params[:user][:id]}")[0]
  end

  def ok_test5
    redirect_url = params[:redirect]
    # ok:tainted-sql-string
    redirect_to "#{authenticator_domain}/application-name/landing?redirect_path=#{redirect_url}"
  end

  def ok_test6
    # ok:tainted-sql-string
    user = User.where(user_id: params[:user_id])[0]
    # ok:tainted-sql-string
    user = User.where(params.slice(:user_id))[0]
  end

end

