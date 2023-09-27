class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :description, :token, :permission

  def token
    scope[:token] if scope.present?
  end

end
