class User < ActiveRecord::Base
  has_secure_password validations: false

  validates_presence_of :email, :password
  validates :email, uniqueness: true
end
