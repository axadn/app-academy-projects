class SessionsController < ApplicationController

  def create
    session_params = user_params
    user = User.find_by_credentials(session_params[:email],
                                    session_params[:password])
    if user
      login_user!(user)
      redirect_to user_url(user)
    else
      flash[:errors] = ["Invalid credentials"]
      redirect_to new_session_url
    end
  end

  def new
    render :new
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
  end
end
