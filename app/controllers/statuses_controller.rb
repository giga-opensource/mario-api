class StatusesController < ApplicationController
  before_action :set_status, only: [:show, :update, :destroy]

  def index
    project = Project.find_by(id: params[:project_id])
    fail BadRequest unless project
    statuses = project.statuses
    render json: statuses
  end

  def create
    @status = Status.new(status_params)

    if @status.save
      render json: @status
    else
      render json: @status.errors, status: :unprocessable_entity
    end
  end

  def update
    if @status.update(status_params)
      render json: @status
    else
      render json: @status.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @status.destroy
      render json: @status
    else
      render json: @status.errors, status: :unprocessable_entity
    end
  end

  private
    def set_status
      @status = Status.find(params[:id])
    end

    def status_params
      params.require(:status).permit(:project_id, :name)
    end
end
