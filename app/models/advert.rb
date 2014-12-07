class Advert < ActiveRecord::Base
  has_many :photos, dependent: :destroy

  validates :description, presence: true

  default_scope { order('created_at DESC') }
end
