class SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(user_params[:username],
    user_params[:password])
    if @user
      login(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ["Invalid username or password"]
      render :new
    end
  end

  def new
    render :new
  end

  def destroy
    logout(current_user)
    redirect_to new_session_url
  end

end
