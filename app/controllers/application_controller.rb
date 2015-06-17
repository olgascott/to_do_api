class ApplicationController < ActionController::Base
  respond_to :json

  def api_response_unprocessable_entity
    render json: { data: nil }, status: :unprocessable_entity
  end
end
