class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false}
  # Not required because of has_secure_password
  # validates :password, presence: true
  validates :password, length: { in: 3..10 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password) 
    email = email.strip.downcase
    if @user = User.find_by_email(email).try(:authenticate, password)
      @user
    else
      nil
    end
  end

end