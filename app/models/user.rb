class User < ApplicationRecord
  has_secure_password

  validates_presence_of :password_digest, :email
  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
