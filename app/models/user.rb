class User < ActiveRecord::Base

  has_secure_password validations: true

  validates_confirmation_of :password
  validates :email, :username, presence: :true
  validates :password, presence: true, on: :create

  before_create :generate_access_token

  def generate_access_token
    self.access_token = SecureRandom.hex(32)
  end

  def access_token_valid?(checking_token)
    self.access_token == checking_token
  end

end
