class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :token

  def token
    scope[:token] if scope.present?
  end

end
