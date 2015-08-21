class IssueDetailSerializer < ActiveModel::Serializer
  cache key: "issue-detail"

  attributes :id, :subject, :due_date, :description, :project_id

  belongs_to :creator
  belongs_to :assignee
  belongs_to :target_version
  belongs_to :priority
  belongs_to :tracker
  belongs_to :project, serializer: ProjectRelationshipsSerializer

end
