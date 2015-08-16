class Issue < ActiveRecord::Base

  validates :project_id, :creator_id, :subject, presence: true

  belongs_to :project
  belongs_to :creator, class_name: 'User'
  belongs_to :assignee, class_name: 'User', required: false

  belongs_to :target_version
  belongs_to :priority
  belongs_to :tracker

  scope :created_by, -> (creator) { where(creator: creator) }
  scope :assigned_to, -> (assignee) { where(assignee: assignee) }

end
