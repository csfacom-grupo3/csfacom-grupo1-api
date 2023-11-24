class Api::V1::ProjectMembersController < ApplicationController
  before_action :authenticate_user_from_token, except: [:index]
  before_action :user_is_admin_or_projects?, except: [:index]
  before_action :find_project
  before_action :find_project_member, only: [:update, :destroy]

  def index
    render_success(serialize_resource_list(@project.project_members, ProjectMembers::LightSerializer))
  end

  def create
    @project_member = @project.project_members.create(project_members_params)

    return render_unprocessable_entity(@project_member.errors.full_messages) unless @project_member.persisted?

    render_created(serialize_resource(@project_member, ProjectMembers::LightSerializer))
  end

  def update
    return render_unprocessable_entity(@project_member.errors.full_messages) unless @project_member.update(project_members_params)

    render_created(serialize_resource(@project_member, ProjectMembers::LightSerializer))
  end

  def destroy
    return render_success if @project_member.destroy

    render_unprocessable_entity
  end

  private

  def find_project
    @project = Project.find_by(id: params[:project_id])

    render_not_found if @project.blank?
  end

  def find_project_member
    @project_member = @project.project_members.find_by(member_id: params[:id])

    render_not_found if @project.blank?
  end

  def project_members_params
    params.permit(:role_id)
  end

end
