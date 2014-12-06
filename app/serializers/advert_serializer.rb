class AdvertSerializer < ActiveModel::Serializer
  attributes :id, :description, :path, :image_url, :images

  def path
    api_advert_path(object)
  end

  def image_url
    object.photos.empty? ? '/system/missing.png' : object.photos.first.image.url
  end

  def images
    object.photos.map{ |p| p.image.url }
  end
end
