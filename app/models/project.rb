class Project < ActiveRecord::Base

  validates :name, :user_id, presence: true

  belongs_to :creator, class_name: 'User', foreign_key: :user_id

  has_many :projects_users, class_name: 'ProjectsUsers'
  has_many :users, through: :projects_users

  after_create :create_user_link

  private

  def create_user_link
    self.projects_users.create user: creator
  end
end
