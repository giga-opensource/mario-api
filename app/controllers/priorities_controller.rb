class  PrioritiesController < ApplicationController
  before_action :set_priority, only: [:show, :update, :destroy]

  def index
    project = Project.find_by(id: params[:project_id])
    fail BadRequest unless project
    priorities = project.priorities
    render json: priorities
  end

  def show
    render json: @priority
  end

  def create
    @priority = Priority.new(priority_params)

    if @priority.save
      render json: @priority, status: :created, location: @priority
    else
      render json: @priority.errors, status: :unprocessable_entity
    end
  end

  def update
    if @priority.update(priority_params)
      render json: @priority
    else
      render json: @priority.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @priority.destroy
      render json: @priority
    else
      render json: @priority.errors, status: :unprocessable_entity
    end
  end

  private
    def set_priority
      @priority = Priority.find(params[:id])
    end

    def priority_params
      params.require(:priority).permit(:name, :project_id)
    end
end
