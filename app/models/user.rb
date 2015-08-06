class User < ActiveRecord::Base

  has_secure_password validations: true

  validates_confirmation_of :password
  validates :email, :username, presence: :true
  validates :password, presence: true, on: :create

end
