class AlbumsController < ApplicationController
    #renders album
    def show
    end

    #render create new album page
    def new
        @album = Album.new
        @bands = Band.all
        @current_band_id = params[:band_id]
        render :new
    end
    
    #creates and saves into DB
    def create
        @album = Album.new(album_params)
        if @album
            redirect_to bands_url
        else
            render json: @album.errors.full_messages, status: 422
        end
    end

    #render update album page
    def edit
    end

    #updates and saves into DB
    def update
    end

    #deletes the album from DB
    def destroy
    end

    private
    def album_params
        params.require(:album).permit(:title, :band_id, :year, :live?)
    end
end
