class PicturesController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :delete]

    def index
        pictures = Picture.all
        reverse_pics = pictures.reverse
        render json: reverse_pics
    end 

    def create
        picture = Picture.create(user_id: params[:user_id], address: params[:address])
        picture.avatar.attach(params[:avatar])
        picture.address = url_for(picture.avatar)
        picture.photo = params[:url]
        picture.save
        # byebug
        render json: picture
    end 

    def delete
        # byebug
        picture = Picture.find_by(id: params[:id])
        picture.delete
        render json: picture
    end 

    def logo 
        user = User.first
        # byebug
        render json: user
      end 

    private

    def picture_params
        require(:picture).permit(:id, :address, :user_id, :avatar, :url)
    end 
end
