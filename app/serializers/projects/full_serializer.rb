class Projects::FullSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_date, :end_date, :description

  belongs_to :coordinator, serializer: User::LightSerializer
  has_many :project_members, serializer: ProjectMembers::LightSerializer

end
