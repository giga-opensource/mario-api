class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy, :users, :manage_users]

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

  def users
    users = @project.users
    render json: users
  end

  def manage_users
    if params[:action] == 'add'
      @project.projects_users.create user_id: params[:user_id]
    elsif params[:action] == 'remove'
      @project.projects_users.where(user_id: params[:user_id]).destroy_all
    end
    render status: 200
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :description)
    end
end
