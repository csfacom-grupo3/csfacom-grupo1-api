class User::FullSerializer < ActiveModel::Serializer
  attributes :id, :avatar_url, :github, :linkedin, :email, :name, :description, :token, :permission

  belongs_to :academic_bond, serializer: AcademicBond::LightSerializer
  has_many :roles, serializer: Roles::LightSerializer
  has_many :projects, serializer: Roles::LightSerializer

  def token
    scope[:token] if scope.present?
  end

end
