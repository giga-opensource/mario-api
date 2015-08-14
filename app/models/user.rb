class User < ActiveRecord::Base

  has_secure_password validations: true

  validates_confirmation_of :password
  validates :password, presence: true, on: :create
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true

  after_create :generate_access_token

  has_many :projects_users, class_name: 'ProjectsUsers'
  has_many :projects, through: :projects_users

  def generate_access_token
    self.access_token = SecureRandom.hex(32)
    self.save
  end

  def access_token_valid?(checking_token)
    self.access_token == checking_token
  end

end
