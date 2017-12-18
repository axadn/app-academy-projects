class UsersController < ApplicationController
  before_action :ensure_not_logged_in
  def new
    render :new
  end

  def create
    u = User.new(user_params)
    if u.save
      redirect_to cats_url
    else
      flash[:errors] = u.errors.full_messages
      redirect_to new_user_url
    end
  end


end
