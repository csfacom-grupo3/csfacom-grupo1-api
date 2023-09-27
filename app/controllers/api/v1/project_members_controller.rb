class Api::V1::ProjectMembersController < ApplicationController
  before_action :authenticate_user_from_token

  def index
    @projectMembers = ProjectMember.all
  end

  def show
    @projectMember = ProjectMember.find(params[:id])
  end
  
  def create
    @projectMember = ProjectMember.new(projectMember_params)
    if @projectMember.save
      redirect_to @projectMember
    else
      render 'new', status: :unprocessable_entify
    end
  end

  def update
    @projectMember = ProjectMember.find(params[:id])
    if @projectMember.update(projectMember)
      redirect_to @projectMember
    else
      render 'edit', status: :unprocessable_entify
    end
  end

  def destroy
    @projectMember = ProjectMember.find(params[:id])
    @projectMember.destroy
    redirect_to projectMembers_path
  end

  private

  def projectMember_params
    params.require(:project).permit(:entryDate, :departureDate, :active)
  end
end
