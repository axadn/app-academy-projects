class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user
  def login(user)
    session_model = Session.new(user: user)
    session_model.session_info = request.env['HTTP_USER_AGENT']
    session[:session_token] = session_model.token
    session_model.save
  end

  def current_user
    session_model = Session.find_by(token: session[:session_token])
    if session_model
      return session_model.user
    end
    nil
  end

  def logged_in?
    !!current_user
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
  def ensure_logged_in
    redirect_to new_session_url unless logged_in?
  end
  def logout

  end
end
