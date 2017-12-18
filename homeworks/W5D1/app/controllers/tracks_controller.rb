class TracksController < ApplicationController
  def new
    render :new
  end

  def create
    track = Track.new(track_params)
    if track.save
      redirect_to album_url(track_params[:album_id])
    else
      flash[:errors] = track.errors.full_messages
      redirect_to new_album_track_url
    end
  end

  def edit
    @track = Track.find_by(id: params[:id])
    render :edit
  end

  def update
    @track = Track.find_by(id: params[:id])
    @track.assign_attributes
    if @track.save
      redirect_to album_url(track_params[:album_id])
    else
      flash[:errors] = @track.errors.full_messages
      redirect_to edit_track_url(params[:id])
    end
  end

  def destroy
    @track = Track.find_by(id: params[:id])
    if @track
      @track.destroy
    end
  end

  def show
    @track = Track.find_by(id: params[:id])
    if @track
      render :show
    else
      render json: 404
    end
  end

  def track_params
    params.require(:track).permit(:title, :lyrics, :ord, :album_id,
      :bonus)

  end
end
