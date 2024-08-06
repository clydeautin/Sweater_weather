class ApplicationController < ActionController::API

  def authenticate_api_key

    request_api_key = params[:api_key]
    stored_api_key = User.find_by(api_key: request_api_key)
    # require 'pry'; binding.pry

    unless request_api_key && stored_api_key
      render json: { error: 'Unauthorized: Invalid or missing API key' }, status: :unauthorized
    end
  end

end
