class SessionsController < ApplicationController
  before_action :ensure_not_logged_in, except: :destroy
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(user_params[:user_name],user_params[:password])
    if user
      login_user!(user)
      redirect_to cats_url
    else
      flash[:errors] = ["Invalid username or password"]
      redirect_to new_session_url
    end
  end



  def destroy
    logout!(params[:session_token])
    redirect_to cats_url
  end
end
