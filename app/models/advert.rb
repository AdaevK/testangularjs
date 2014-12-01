class Advert < ActiveRecord::Base
  validates :description, presence: true
end
