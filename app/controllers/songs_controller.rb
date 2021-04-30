class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def show
        @song = Song.find_by(id: 
        params[:id]
        )
        if @song
            render :show
        else
            redirect_to(model_path(@songs))
        end
    end

end
