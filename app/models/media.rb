class Media < ActiveRecord::Base
  belongs_to :user
  belongs_to :media_info, polymorphic: true
  has_many :comments, as: :commentable

  validates :url, :user, presence: true

  scope :newest_first, -> { order('created_at desc') }
end