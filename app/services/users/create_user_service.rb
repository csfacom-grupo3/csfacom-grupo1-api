class Users::CreateUserService < BaseService
  steps :verify_password,
        :create_user

  def initialize(params)
    @params = params
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
