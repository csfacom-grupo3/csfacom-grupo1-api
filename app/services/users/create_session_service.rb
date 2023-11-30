class Users::CreateSessionService < BaseService
  steps :find_user,
        :verify_password

  def initialize(params)
    @email = params[:email]
    @password = params[:password]
  end

  def call
    process_steps

    @user
  end

  private

  def find_user
    @user = User.find_for_database_authentication(email: @email)
    fail('Email ou senha inválida') unless @user.present?
  end

  def verify_password
    fail('Email ou senha inválida') unless @user.valid_password?(@password)
  end

end
