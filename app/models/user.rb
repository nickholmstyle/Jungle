class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :email, presence: true, confirmation: { case_sensitive: false }, uniqueness: true

  validates :password, presence: true, confirmation: true, length: { minimum: 3 }
  validates :password_confirmation, presence: true
  
  def authenticate_with_credentials(email, password)
    user = User.find_by_email(:email)
    if user && user.authenticate(:password)
     return user
    end
  end
end
