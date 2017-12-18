class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def login(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end
#

  def ensure_correct_user
    redirect_to user_url(current_user) if current_user.id != params[:user_id]
  end
  def logout(user)
    user.reset_session_token!
    session[:session_token] = nil
  end
  def user_params
    params.require(:user).permit(:username, :password)
  end
  def ensure_logged_in
    redirect_to new_session_url unless logged_in?
  end
end
