class IssueSerializer < ActiveModel::Serializer
  cache key: 'updated_at'

  attributes :id, :subject, :due_date, :description, :project_id, :tracker_id, :target_version_id, :priority_id, :status_id, :assignee_id

  belongs_to :creator
  belongs_to :assignee
  belongs_to :target_version
  belongs_to :priority
  belongs_to :tracker
  belongs_to :status

end
