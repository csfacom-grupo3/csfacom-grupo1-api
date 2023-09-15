module ApiTokenAuthenticatable
  extend ActiveSupport::Concern

  def authenticate_user_from_token
    request_email = request.headers['HTTP_USER_EMAIL'].presence
    request_token = request.headers['HTTP_USER_TOKEN'].presence

    user = request_email && User.find_by(email: request_email)

    if user.present? && user.token_match?(request_token)
      sign_in user, store: false
      @user ||= user
    else
      render_unauthorized
    end
  end

  def build_headers_token(user)
    return unless user&.persisted?

    authenticate = user.refresh_token

    response.headers['HTTP_USER_EMAIL'] = authenticate[:email]
    response.headers['HTTP_USER_TOKEN'] = authenticate[:token]

    authenticate
  end

  def current_user
    @user
  end
end
