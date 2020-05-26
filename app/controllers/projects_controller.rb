class ProjectsController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :delete, :show, :edit]

    def index
        projects = Project.all 
        render json: projects
    end 

    def show
        project = Project.find(params[:id])
        render json: project
    end 

    def create
        # byebug
        project = Project.create(project_params)
        render json: project
    end 

    def edit 
        project = Project.find(params[:id])
        project.address = params[:address]
        project.beds = params[:beds]
        project.baths = params[:baths]
        project.completion_date = params[:completion_date]
        project.square_feet = params[:square_feet]
        project.comment = params[:comment]
        if params[:avatar]
            project.avatar.purge
            project.avatar.attach(params[:avatar])
            project.photo = params[:url]
        end 
        project.save
        render json: project
    end 

    def delete 
        project = Project.find_by(id: params[:id])
        project.delete
        render json: project
    end 

    private
 
    def project_params
        params.permit(:id, :address, :beds, :baths, :completion_date,
         :square_feet, :user_id, :avatar, :comment, :url)
    end
end
