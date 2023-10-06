class Api::V1::ProjectsController < ApplicationController
  before_action :authenticate_user_from_token, except: [:index]
  before_action :user_is_admin_or_projects?, except: [:index]
  before_action :find_project, except: [:index, :create]

  def index
    render_success(
      serialize_resource_list(Project.all, Projects::FullSerializer)
    )
  end

  def create
    @project = Project.create(project_params)

    return render_unprocessable_entity(@project.errors.full_messages) unless @project.persisted?

    render_created(serialize_resource(@project, Projects::FullSerializer))
  end

  def show
    render_success(serialize_resource(@project, Projects::FullSerializer))
  end

  def update
    return render_unprocessable_entity(@project.errors.full_messages) unless @project.update(project_params)

    render_created(serialize_resource(@project, Projects::FullSerializer))
  end

  def destroy
    return render_success if @project.destroy

    render_unprocessable_entity
  end

  private

  def find_project
    @project = Project.find_by(id: params[:id])

    render_not_found if @project.blank?
  end

  def project_params
    params.permit(:name, :start_date, :end_date, :description, :coordinator_id)
  end

  def user_is_admin_or_projects?
    render_unauthorized unless current_user.admin? || current_user.projects?
  end

end
