class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :email
  enum role: [:user, :admin]
end
