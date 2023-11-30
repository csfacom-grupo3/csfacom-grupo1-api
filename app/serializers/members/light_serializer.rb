class Members::LightSerializer < ActiveModel::Serializer
  attributes :id, :avatar_url, :github, :linkedin, :email, :name, :description

  belongs_to :academic_bond, serializer: AcademicBond::LightSerializer

end
