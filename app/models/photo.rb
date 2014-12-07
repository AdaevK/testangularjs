class Photo < ActiveRecord::Base
  belongs_to :advert

  has_attached_file :image, default_url: '/system/missing.png'
  validates_attachment :image, presence: true,
    content_type: { content_type: [ 'image/png', 'image/jpeg', 'image/jpg' ] },
    size: { less_than: 2.megabyte }
end
