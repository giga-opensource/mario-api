class IssueSerializer < ActiveModel::Serializer
  cache key: 'updated_at'

  attributes :id, :subject, :due_date

  belongs_to :creator
  belongs_to :assignee
end
