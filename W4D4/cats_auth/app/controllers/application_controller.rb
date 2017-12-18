class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :logged_in?, :correct_owner?

  def login_user!(user)
    new_session = Session.new(user_id: user.id,
      session_token: user.generate_session_token, env: request.env["HTTP_USER_AGENT"])
    new_session.save
    session[:session_token] = new_session.session_token
  end

  def logout!(session_token)
    old_session = Session.find_by(session_token: session_token)
    old_session.delete
  end

  def current_user
    return nil unless session[:session_token]
    found_session = Session.find_by(session_token: session[:session_token])
    return nil unless found_session
    @user ||= found_session.user
  end

  def logged_in?
    !current_user.nil?
  end

  def user_params
    params.require(:user).permit(:user_name, :password)
  end

  def ensure_correct_owner
    if current_user.cats.find_by(id: params[:id]).nil?
      redirect_to cats_url
    end
  end

  def correct_owner?
    !current_user.cats.find_by(id: params[:id]).nil?
  end

  def ensure_not_logged_in
    redirect_to cats_url if logged_in?
  end
end
