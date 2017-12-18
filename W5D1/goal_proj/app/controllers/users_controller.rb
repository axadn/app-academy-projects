class UsersController < ApplicationController

  def new
    render :new
  end

  def show
    render :show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to(user_url(@user))
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  
end
