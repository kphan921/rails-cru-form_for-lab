class GenresController < ApplicationController
    before_action :find_genre, only: [:show, :edit, :update]
  def index
    @genres = Genre.all
  end

  def show
    if @genre
      render :show
    else
      redirect_to(genres_path(@genres))
    end
  end

  def new
      @genre = Genre.new
  end
  

  def edit
  end

  def create
      @genre = Genre.new(genre_params)
      if @genre.save
        flash[:success] = "Genre successfully created"
        redirect_to @genre
      else
        flash[:error] = "Something went wrong"
        render 'new'
      end
  end
  
  
  def update
      if @genre.update_attributes(genre_params)
        flash[:success] = "Genre was successfully updated"
        redirect_to @genre
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

  def find_genre
    @genre = Genre.find_by(id: params[:id])
  end
end
