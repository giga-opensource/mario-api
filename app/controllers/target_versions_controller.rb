class TargetVersionsController < ApplicationController
  before_action :set_target_version, only: [:show, :update, :destroy]

  def index
    project = Project.find_by(id: params[:project_id])
    fail BadRequest unless project
    target_versions = project.target_versions
    render json: target_versions
  end

  def show
    render json: @target_version
  end

  def create
    @target_version = TargetVersion.new(target_version_params)

    if @target_version.save
      render json: @target_version, status: :created, location: @target_version
    else
      render json: @target_version.errors, status: :unprocessable_entity
    end
  end

  def update
    if @target_version.update(target_version_params)
      render json: @target_version
    else
      render json: @target_version.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @target_version.destroy
      render json: @target_version
    else
      render json: @target_version.errors, status: :unprocessable_entity
    end
  end

  private
    def set_target_version
      @target_version = TargetVersion.find(params[:id])
    end

    def target_version_params
      params.require(:target_version).permit(:name, :project_id)
    end
end
