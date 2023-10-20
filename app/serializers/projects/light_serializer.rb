class Projects::LightSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_date, :end_date, :description

  belongs_to :coordinator, serializer: User::LightSerializer
  has_many :members, serializer: Members::LightSerializer

end
