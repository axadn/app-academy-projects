class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find_by(id: params[:id])
    render :show
  end

  def new
    render :new
  end

  def create
    c = Cat.new(cat_parameters)
    if c.save
      redirect_to cats_url
    else
      render json: c.errors.full_messages
    end
  end

  def edit
    @cat = Cat.find_by(id: params[:id])
    render :edit
  end

  def update
    @cat = Cat.find_by(id: params[:id])
    if @cat.update(cat_parameters)
      redirect_to cats_url
    else
      render json: @cat.errors.full_messages
    end
  end

  def cat_parameters
    params.require(:cat).permit(:name, :sex, :color, :description, :birth_date)
  end
end
