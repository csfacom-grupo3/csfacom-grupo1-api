class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user_from_token
  before_action :user_is_admin?, except: [:index]
  before_action :find_user, only: [:show, :update, :destroy]

  def index
    @users = User.all

    render_success(serialize_resource_list(@users, User::LightSerializer))
  end

  def show
    render_success(serialize_resource(@user, User::FullSerializer))
  end

  def create
    @user = User.create(user_params)

    return render_unprocessable_entity(@user.errors.full_messages) unless @user.persisted?

    render_created(serialize_resource(@user, User::FullSerializer))
  end

  def update
    return render_unprocessable_entity(@user.errors.full_messages) unless @user.update(user_params)

    render_created(serialize_resource(@user, User::FullSerializer))
  end

  def destroy
    return render_success if @user.destroy

    render_unprocessable_entity
  end

  private

  def find_user
    @user = User.with_attached_avatar.find_by(id: params[:id])

    render_not_found unless @user.present?
  end

  def user_params
    params.permit(:email, :name, :description, :password, :password_confirmation, :academic_bond_id, permission: [])
  end

end
