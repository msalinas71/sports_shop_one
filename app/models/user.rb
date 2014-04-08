class User < ActiveRecord::Base
  has_secure_password
  
  validates_format_of :email, with: /[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,3})/, message: "is not an email", uniqueness: true
  validates :user_name, :user_last_name, :email, :password, :password_confirmation, presence: true
  validates_format_of :password, with: /(?=^.{8,}$)(?=.*\d+)(?=.*\W+).*/ , message: "include digit and not alphanumeric?"
  validates :password_confirmation, presence: true
end
