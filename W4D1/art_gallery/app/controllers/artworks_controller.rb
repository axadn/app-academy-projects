class ArtworksController < ApplicationController
  def index
    user = User.find(params[:user_id])
    artworks = user.shared_and_owned_artworks
    render json: artworks
  end

  def show
    artwork = Artwork.find(params[:id])
    render json: artwork
  end

  def update
    artwork = Artwork.find(params[:id])
    artwork.update(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    artwork = artwork.find(params[:id])
    artwork.destroy
    render json: artwork
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def artwork_params
    params.require(:artwork).permit(:image_url, :title, :artist_id)
  end
end
