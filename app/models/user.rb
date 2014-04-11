class User < ActiveRecord::Base
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: VALID_EMAIL_REGEX, message: "Is not a valid email" }
  VALID_PASSWORD_REGEX = /(?=^.{8,}$)(?=.*\d+)(?=.*\W+).*/
  validates :password, presence: true
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: "Include digit and not alphanumeric?" }
  validates :user_name, :user_last_name, :password_confirmation, presence: true

end
