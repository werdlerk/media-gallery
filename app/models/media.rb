class Media < ActiveRecord::Base
  belongs_to :user
  belongs_to :media_info, polymorphic: true

end