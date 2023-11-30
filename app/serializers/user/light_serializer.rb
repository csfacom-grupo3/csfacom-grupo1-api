class User::LightSerializer < ActiveModel::Serializer
  attributes :id, :avatar_url, :github, :linkedin, :email, :name, :description

end
