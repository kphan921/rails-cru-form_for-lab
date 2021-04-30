class ArtistsController < ApplicationController
  before_action :find_artist, only: [:show, :edit, :update, :destroy]

  def index
    @artists = Artist.all
  end

  def show
    if @artist
      render :show
    else
      redirect_to artists_path
    end
  end
  

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(artist_params)
    redirect_to artists_path
  end

  def edit
  end

  def update
    @artist.update(artist_params)
	  redirect_to artist_path
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :bio)
  end

  def find_artist
    @artist = Artist.find_by(id: params[:id])
  end
end
