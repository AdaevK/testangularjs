class Advert < ActiveRecord::Base
  has_many :photos, dependent: :destroy

  validates :description, presence: true
end
