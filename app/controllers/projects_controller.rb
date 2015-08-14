class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy]

  def index
    projects = current_user.projects

    render json: projects
  end

  def create
    @project = Project.new(project_params)
    @project.creator = current_user
    if @project.save
      render json: @project, serializer: ProjectSerializer
    else
      render status: 400, json: { errors: @project.errors}
    end
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :description)
    end
end
