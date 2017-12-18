class SubsController < ApplicationController
  before_action :ensure_correct_moderator, only: [:edit, :update]
  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator = current_user
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = sub.errors.full_messages
      render :new
    end
  end

  def update
    @sub.assign_attrributes(sub_params)
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def edit
    render :edit
  end

  def show
    @sub = Sub.find_by(id: params[:id])
    render :show
  end

  def index
    @subs = Sub.all
    render :index
  end
  def sub_params

    params.require(:sub).permit(:description, :title)
  end
  def ensure_correct_moderator
    @sub = Sub.find_by(id: params[:id])
    redirect_to sub_url(params[:id]) unless @sub.moderator == current_user
  end
end
