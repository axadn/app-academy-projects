class SessionsController < ApplicationController
  def new
    render :new
  end
  def create
    @user = User.find_by_credentials(user_params)
    if @user
      login!(@user)
    else
      flash.now[:errors] = ["ivalid credentials"]
      render :new
    end
  end
  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
  end
end
