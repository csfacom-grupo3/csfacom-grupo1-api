class ApplicationController < ActionController::API
  include ApiCommomResponses
  include ApiTokenAuthenticatable

  wrap_parameters false

  def serialize_resource(resource, serializer, scope = {})
    JSON.parse(serializer.new(resource, scope: scope).to_json)
  end

  def serialize_resource_list(resources, serializer, scope = {})
    serialized_resource = ActiveModelSerializers::SerializableResource.new(resources, each_serializer: serializer, options: { scope: scope }).to_json
    JSON.parse(serialized_resource)
  end

end
