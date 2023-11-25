class News::FullSerializer < ActiveModel::Serializer
  attributes :id, :title, :subtitle, :content, :images_url, :visibility

end
