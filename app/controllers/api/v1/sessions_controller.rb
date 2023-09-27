class Api::V1::SessionsController < ApplicationController
  def create
    response_handler(Users::CreateSessionService.call(session_params))
  end

  private

  def session_params
    params.permit(:email, :password)
  end

  def response_handler(service)
    return render_unprocessable_entity(service.errors) unless service.success?

    authenticate = build_headers_token(service.result)
    render_success(serialize_resource(service.result, UserSerializer, authenticate))
  end

end
