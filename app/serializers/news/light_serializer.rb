class News::LightSerializer < ActiveModel::Serializer
  attributes :id, :title, :subtitle, :content, :images_url

  has_many :projects, serializer: Projects::LightSerializer
end
