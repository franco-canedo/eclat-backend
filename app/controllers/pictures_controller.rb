class PicturesController < ApplicationController
    def index
        pictures = Picture.all
    end 

    def create
        picture = Picture.create(picture_params)
    end 

    private

    def picture_params
        require(:picture).permit(:address, :user_id)
    end 
end
