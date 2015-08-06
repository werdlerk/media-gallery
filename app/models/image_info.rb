class ImageInfo < ActiveRecord::Base
  has_one :media, as: :media_info

end