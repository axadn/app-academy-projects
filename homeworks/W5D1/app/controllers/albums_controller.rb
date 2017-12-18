class AlbumsController < ApplicationController

  def new
    render :new
  end

  def create
    album = Album.create(album_params)
    if album.save
      redirect_to band_url(album_params[:band_id])
    else
      flash[:errors] = album.errors.full_messages
      redirect_to new_band_album_url(album_params[:band_id])
    end
  end

  def edit
    @album = Album.find_by(id: params[:id])
    if @album
      render :edit
    else
      render json: 404
    end
  end

  def update
    album = Album.find_by(id: params[:id])
    if album.save
      redirect_to bands_url(album_params[:band_id])
    else
      flash[:errors] = album.errors.full_messages
      redirect_to edit_album_url(album)
    end
  end

  def show
    @album = Album.find_by(id: params[:id])
    if @album
      render :show
    else
      render json: 404
    end
  end


  def destroy
    album = album.find_by(id: params[:id])
    album.destroy
  end

  def album_params
    params.require(:album).permit(:title, :band_id, :year, :live)
  end

end
