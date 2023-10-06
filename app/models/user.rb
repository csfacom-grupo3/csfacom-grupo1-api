class User < ApplicationRecord
  extend Enumerize
  include TokenAuthenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  serialize :permission, Array
  enumerize :permission, in: [:projects, :news, :admin], multiple: true, predicates: true

  has_one_attached :avatar

  belongs_to :academic_bond

  has_many :projects, foreign_key: :coordinator_id

  def avatar_url
    Rails.application.routes.url_helpers.rails_blob_url(avatar, host: Rails.application.credentials.dig(Rails.env.to_sym, :app_domain)) if avatar.attached?
  end
end
