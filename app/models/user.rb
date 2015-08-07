class User < ActiveRecord::Base

  has_secure_password validations: true

  validates_confirmation_of :password
  validates :password, :access_token, presence: true, on: :create
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true

  before_create :generate_access_token

  def generate_access_token
    self.access_token = SecureRandom.hex(32)
  end

  def access_token_valid?(checking_token)
    self.access_token == checking_token
  end

end
