class Api::V1::RolesController < ApplicationController
  before_action :authenticate_user_from_token
  before_action :user_is_admin?, except: [:index]
  before_action :find_role, only: [ :update, :destroy]

  def index
    render_success(serialize_resource_list(Role.all, Roles::LightSerializer))
  end

  def create
    @role = Role.create(role_params)

    render_created(serialize_resource(@role, Roles::LightSerializer))
  end

  def update
    return render_success(serialize_resource(@role, Roles::LightSerializer)) if @role.update(role_params)

    render_unprocessable_entity(@role.errors.full_messages)
  end

  def destroy
    return render_success if @role.destroy
  end

  private

  def role_params
    params.permit(:role_kind)
  end

  def find_role
    @role = Role.find_by(id: params[:id])

    render_not_found unless @role.present?
  end
end
