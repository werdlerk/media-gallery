class User < ActiveRecord::Base
  has_many :media
  has_many :comments

end