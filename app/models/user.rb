class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  # Not required because of has_secure_password
  # validates :password, presence: true
  validates :password_confirmation, presence: true
end