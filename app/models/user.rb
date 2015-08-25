class User < ActiveRecord::Base
  has_many :media
  has_many :comments

  has_secure_password
end