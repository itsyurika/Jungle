class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }

  before_save { self.email = email.downcase }
  def self.authenticate_with_credentials (email, password)
    email = email.strip
    user = User.find_by_email(email.downcase)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
