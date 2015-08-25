class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :update, :destroy]

  def index
    project = Project.find_by(id: params[:project_id])
    fail BadRequest unless project

    issues = project.issues

    if creator = params[:creator_id]
      issues = issues.created_by creator
    end

    if assignee = params[:assignee_id]
      issues = issues.assigned_to assignee
    end

    issues = issues.page(params[:page]).per(params[:perPage] || 20)
    serializer = IssueSerializer::ArraySerializer.new(issues)
    res = {
      issues: IssueSerializer::Adapter::FlattenJson.create(serializer).serializable_hash,
      meta: { total_pages: issues.total_pages, total_count: issues.total_count }
    }
    render json: res
  end

  def show
    render json: @issue
  end

  def create
    @issue = Issue.new(issue_params)
    @issue.creator = current_user

    if @issue.save
      render json: @issue, status: :created, location: @issue
    else
      render json: @issue.errors, status: :unprocessable_entity
    end
  end

  def update
    if @issue.update(issue_params)
      render json: @issue
    else
      render json: @issue.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @issue.destroy
  end

  private
    def set_issue
      @issue = Issue.find(params[:id])
    end

    def issue_params
      params.require(:issue).permit(:subject, :project_id, :assignee_id, :due_date, :description, :tracker_id, :priority_id, :target_version_id)
    end
end
