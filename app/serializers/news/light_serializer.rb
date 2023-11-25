class News::LightSerializer < ActiveModel::Serializer
  attributes :id, :title, :subtitle, :content, :images_url

end
