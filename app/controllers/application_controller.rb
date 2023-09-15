class ApplicationController < ActionController::API
  include ApiCommomResponses
  include ApiTokenAuthenticatable

  wrap_parameters false

  def serialize_resource(resource, serializer, scope = {})
    JSON.parse(serializer.new(resource, scope: scope).to_json)
  end

end
