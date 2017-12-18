class SessionsController < ApplicationController

  def destroy
    session = Session.find_by(id: params[:id])
    session.destroy if session.user == current_user
    redirect_to subs_url
  end
  def new
    render :new
  end
  def create
    @user = User.find_by_credentials(user_params[:username],
     user_params[:password])
     if @user
       login(@user)
       redirect_to user_url(@user)
     else
       flash.now[:errors]
       render :new
     end
  end
end
