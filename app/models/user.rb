class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :email, presence: true, confirmation: { case_sensitive: false }, uniqueness: true

  validates :password, presence: true, confirmation: true, length: { minimum: 3 }
  validates :password_confirmation, presence: true
  

  # finds and returns a user if email and password can be autenticated.
  # email is also stripped of white space if user added any, and case is converted to lowercase. 
  def self.authenticate_with_credentials(email, password)
    
    user = User.find_by_email(email.strip.downcase)

    if user && user.authenticate(password)
      return user
    end
  end

end