class AdvertSerializer < ActiveModel::Serializer
  self.root = false

  attributes :id, :description, :path, :image_url

  def path
    advert_path(object)
  end

  def image_url
    object.photos.empty? ? '/system/missing.png' : object.photos.first.image.url
  end
end
