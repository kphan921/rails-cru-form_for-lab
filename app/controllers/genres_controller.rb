class GenresController < ApplicationController
    def index
        @genres = Genre.all
    end

    def show
        @genre = Genre.find_by(id: 
        params[:id]
        )
        if @genre
            render :show
        else
            redirect_to(model_path(@genres))
        end
    end
    
    

    private

    def genre_params
        params.require(:genre).permit(:name)
    end
end
