class PicturesController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :delete]
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]

    def index
        pictures = Picture.all
        reverse_pics = pictures.reverse
        render json: reverse_pics
    end 

    def create
        picture = Picture.create(user_id: params[:user_id], address: params[:address])
        picture.avatar.attach(params[:avatar])
        picture.photo = url_for(picture.avatar)
        picture.save
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
        require(:picture).permit(:id, :address, :user_id, :avatar)
    end 

    def set_picture
        @picture = Picture.find(params[:id])
    end

    def set_s3_direct_post
        @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
    end
end
