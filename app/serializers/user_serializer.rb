class UserSerializer < ActiveModel::Serializer
  attributes :id, :avatar_url, :github, :linkedin ,:email, :name, :description, :token, :permission 

  def token
    scope[:token] if scope.present?
  end

  def avatar_url
    Rails.application.routes.url_helpers.rails_blob_url(object.avatar, host: Rails.application.credentials.dig(Rails.env.to_sym, :app_domain)) if object.avatar.attached?
  end
end
