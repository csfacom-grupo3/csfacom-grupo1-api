class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user_from_token
  before_action :user_is_admin?
  before_action :find_user, only: [:show, :update, :destroy]

  def index
    @users = User.all

    render_success(serialize_resource_list(@users, UserSerializer))
  end

  def show
    render_success(serialize_resource(@user, UserSerializer))
  end

  def create
    @user = User.create(user_params)

    return render_unprocessable_entity(@user.errors.full_messages) unless @user.persisted?

    render_created(serialize_resource(@user, UserSerializer))
  end

  def update
    return render_unprocessable_entity(@user.errors.full_messages) unless @user.update(user_params)

    render_created(serialize_resource(@user, UserSerializer))
  end

  def destroy
    return render_success if @user.destroy

    render_unprocessable_entity
  end

  private

  def find_user
    @user = User.find_by(id: params[:id])

    render_not_found unless @user.present?
  end

  def user_params
    params.permit(:email, :name, :description, :password, :password_confirmation, permission: [])
  end

  def user_is_admin?
    render_unauthorized unless current_user.admin?
  end

end
