class User::FullSerializer < ActiveModel::Serializer
  attributes :id, :avatar_url, :github, :linkedin ,:email, :name, :description, :token, :permission 

  def token
    scope[:token] if scope.present?
  end
end
