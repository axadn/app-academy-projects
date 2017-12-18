class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages,
       status: :unprocessable_entity
    end
  end

  def show
    user = User.find_by(id: params[:id])
    if user
      render json: user
    else
      render plain: "Couldn't find any such user", status: 404
    end
  end

  def update
    user = User.find_by(id: params[:id])
    if user
      if user.update_attributes(user_params)
        render json: user
      else
        render json: user.errors.full_messages,
         status: :unprocessable_entity
      end
    else
      render json: "Error 404: not found", status: 404
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user
      user.destroy
      render json: user
    else
      render json: "Error 404: not found", status: 404
    end
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end
end
