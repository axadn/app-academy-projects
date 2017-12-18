class BandsController < ApplicationController
  def create
    band = Band.new(band_params)
    if band.save
      redirect_to bands_url
    else
      flash[:errors] = band.errors.full_messages
      redirect_to new_band_url
    end
  end

  def new
    render :new
  end

  def show
    @band = Band.find_by(id: params[:id])
    if @band
      render :show
    else
      render json: 404
    end
  end

  def destroy
    @band = Band.find_by(id: params[:id])
    if @band
      @band.destroy
    end
  end

  def edit
    @band = Band.find_by(id: params[:id])
    if @band
      render :edit
    else
      render json: 404
    end
  end

  def update
    band = Band.find_by(id: params[:id])
    band.assign_attributes(band_params)
    if band.save
      redirect_to bands_url
    else
      flash[:errors] = band.errors.full_messages
      redirect_to edit_band_url
    end
  end

  def band_params
    params.require(:band).permit(:name)
  end

  def index
    @bands = Band.all
    render :index
  end
end
