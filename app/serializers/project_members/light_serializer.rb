class ProjectMembers::LightSerializer < ActiveModel::Serializer
  attributes :id, :name, :role

  def id
    object.member.id
  end

  def name
    object.member.name
  end

  def role
    object.role.role_kind
  end

end
