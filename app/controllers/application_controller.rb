class ApplicationController < ActionController::API
  include ApiCommomResponses
  include ApiTokenAuthenticatable

  wrap_parameters false

  def serialize_resource(resource, serializer, scope = {})
    JSON.parse(serializer.new(resource, scope:).to_json)
  end

  def serialize_resource_list(resources, serializer, scope = {})
    serialized_resource = ActiveModelSerializers::SerializableResource.new(resources, each_serializer: serializer, options: { scope: }).to_json
    JSON.parse(serialized_resource)
  end

  def user_is_admin_or_projects?
    render_unauthorized unless current_user.admin? || current_user.projects?
  end

  def user_is_admin?
    render_unauthorized unless current_user.admin?
  end

end
