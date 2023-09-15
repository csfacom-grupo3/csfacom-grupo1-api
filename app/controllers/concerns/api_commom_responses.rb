module ApiCommomResponses
  extend ActiveSupport::Concern

  def render_unauthorized
    head :unauthorized
  end

  def render_success(data = {})
    render json: data, status: :ok
  end

  def render_created(data = {})
    render json: data, status: :created
  end

  def render_unprocessable_entity(data = {})
    render json: { errors: data }, status: :unprocessable_entity
  end
end
