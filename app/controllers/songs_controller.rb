class SongsController < ApplicationController
before_action :find_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find_by(id: params[:id])
    if @song
      render :show
    else
      redirect_to(songs_path(@songs))
    end
  end

  def new
    @song = Song.new
  end

  def create
      @song = Song.new(song_params)
      if @song.save
        flash[:success] = "Song successfully created"
        redirect_to @song
      else
        flash[:error] = "Something went wrong"
        render 'new'
      end
  end
  

  def edit
  end
  
  def update
      if @song.update_attributes(song_params)
        flash[:success] = "Song was successfully updated"
        redirect_to @song
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  

  private

  def find_song
    @song = Song.find_by(id: params[:id])
  end

  def song_params
    params.require(:song).permit(:name, :artist_id, :genre_id)
  end
end
