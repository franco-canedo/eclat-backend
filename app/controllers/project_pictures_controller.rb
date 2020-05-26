class ProjectPicturesController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :delete, :show]

    def index
        project_picture = ProjectPicture.all
        render json: project_picture
    end 


    def create
        project_picture = ProjectPicture.create(
            project_id: params[:project_id], address: params[:address])
        project_picture.avatar.attach(params[:avatar])
        project_picture.photo = params[:url]
        project_picture.save
        render json: project_picture
    end 

    def delete
        # byebug
        project_picture = ProjectPicture.find_by(id: params[:id])
        project_picture.delete
        render json: project_picture
    end 

    private

    def picture_params
        params.require(:project_picture).permit(:id, :address, :project_id, :avatar, :url)
    end 
end
