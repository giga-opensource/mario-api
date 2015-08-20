class IssueDetailSerializer < ActiveModel::Serializer
  cache key: 'updated_at'

  attributes :id, :subject, :due_date, :description, :project_id

  belongs_to :creator
  belongs_to :assignee
  belongs_to :target_version
  belongs_to :priority
  belongs_to :tracker
  belongs_to :project

end
