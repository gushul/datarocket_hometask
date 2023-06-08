class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid do |exception|
    render json: { error: exception.record&.errors&.messages }, status: :unprocessable_entity
  end

  rescue_from ActionController::ParameterMissing do |exception|
    render json: { error: exception.message }, status: :bad_request
  end
end
