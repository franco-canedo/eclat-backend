class ProjectsController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :delete]

    def index
        projects = Project.all 
        render json: projects
    end 

    def create
        # byebug
        project = Project.create(project_params)
        render json: project
    end 

    def delete 
        project = Project.find_by(id: params[:id])
        project.delete
        render json: project
    end 

    private
 
    def project_params
        params.permit(:id, :address, :beds, :baths, :completion_date, :user_id)
    end
end
