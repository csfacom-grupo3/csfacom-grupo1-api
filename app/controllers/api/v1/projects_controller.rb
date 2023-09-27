class Api::V1::ProjectsController < ApplicationController
  before_action :authenticate_user_from_token

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project
    else
      render 'new', status: :unprocessable_entify
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project)
      redirect_to @project
    else
      render 'edit', status: :unprocessable_entify
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :members, :startDate, :endDate, :status)
  end
end
