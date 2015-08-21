class TrackersController < ApplicationController
  before_action :set_tracker, only: [:show, :update, :destroy]

  def index
    project = Project.find_by(id: params[:project_id])
    fail BadRequest unless project
    trackers = project.trackers
    render json: trackers
  end

  def show
    render json: @tracker
  end

  def create
    @tracker = Tracker.new(tracker_params)

    if @tracker.save
      render json: @tracker, status: :created, location: @tracker
    else
      render json: @tracker.errors, status: :unprocessable_entity
    end
  end

  def update
    if @tracker.update(tracker_params)
      render json: @tracker
    else
      render json: @tracker.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @tracker.destroy
      render json: @tracker
    else
      render json: @tracker.errors, status: :unprocessable_entity
    end
  end

  private
    def set_tracker
      @tracker = Tracker.find(params[:id])
    end

    def tracker_params
      params.require(:tracker).permit(:name, :project_id)
    end
end
