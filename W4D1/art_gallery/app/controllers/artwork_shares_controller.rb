class ArtworkSharesController < ApplicationController
  def create
    p = params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    share = ArtworkShare.new(p)
    if share.save
      render json: share
    else
      render json: share.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    artwork_share = ArtworkShare.find params[:id]
    artwork_share.destroy
    render json: artwork_share
  end
end
