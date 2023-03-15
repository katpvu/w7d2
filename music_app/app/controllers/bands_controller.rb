class BandsController < ApplicationController
    before_action :set_band, only: [:show, :edit, :update, :destroy]

    #sets @band for those for methods
    def set_band
        @band = Band.find_by(id: params[:id])
    end

    #renders a page that shows all the bands
    def index
        @bands = Band.all
        render :index
    end
    
    #renders a create new band page
    def new
        @band = Band.new
        render :new
    end

    #creating band instance and saving to database
    def create
        @band = Band.new(band_params)
        if @band.save!
            redirect_to band_url(@band)
        else
            render json: @band.errors.full_messages, status: 422
        end
    end

    #render edit band info
    def edit
        # @band = Band.find_by(id: params[:id])
        render :edit
    end
    
    #edit band info
    def update
        # @band = Band.find_by(id: params[:id])
        if @band && @band.update(band_params)
            redirect_to band_url(@band.id)
        else 
            render json: @band.errors.full_messages, status: 422 #:unprocessable_entity
        end 
    end

    #show band page
    def show
        # @band = Band.find_by(id: params[:id])
        render :show
    end

    #delete a band
    def destroy
        # @band = Band.find_by(id: params[:id])
        @band.destroy
        redirect_to bands_url
    end

    private
    def band_params
        params.require(:band).permit(:name)
    end
end
