class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :update, :destroy]

  # GET /activities
  def index
    issue = Issue.find(params[:issue_id])
    @activities = issue.activities

    render json: @activities
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.creator = current_user

    if @activity.save
      render json: @activity, status: :created, location: @activity
    else
      render json: @activity.errors, status: :unprocessable_entity
    end
  end

  def update
    if @activity.update(activity_params)
      render json: @activity
    else
      render json: @activity.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @activity.destroy
      render json: @activity
    else
      render json: @activity.errors, status: :unprocessable_entity
    end
  end

  private
    def set_activity
      @activity = Activity.find(params[:id])
    end

    def activity_params
      params.require(:activity).permit(:issue_id, :original)
    end
end
