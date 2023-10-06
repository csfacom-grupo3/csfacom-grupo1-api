class Api::V1::AcademicBondsController < ApplicationController
  before_action :authenticate_user_from_token
  before_action :user_is_admin?, except: [:index]
  before_action :find_academic_bond, only: [:update, :destroy]

  def index
    @bonds = AcademicBond.all
    render_success(serialize_resource_list(@bonds, AcademicBond::LightSerializer))
  end

  def create
    @bond = AcademicBond.create(academic_bond_params)

    return render_created(serialize_resource(@bond, AcademicBond::LightSerializer)) if @bond.persisted?

    render_unprocessable_entity(@bond.errors.full_messages)
  end

  def update
    return render_success(serialize_resource(@bond, AcademicBond::LightSerializer)) if @bond.update(academic_bond_params)

    render_unprocessable_entity(@bond.errors.full_messages)
  end

  def destroy
    return render_success if @bond.destroy

    render_unprocessable_entity
  end

  private

  def academic_bond_params
    params.permit(:bond_kind)
  end

  def find_academic_bond
    @bond = AcademicBond.find_by(id: params[:id])

    render_not_found unless @bond.present?
  end

end
