class User < ActiveRecord::Base
  has_many :media
  has_many :comments

  has_secure_password

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
end