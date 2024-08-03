class Api::V1::WeatherController < ApplicationController
  def forecast
    # require 'pry'; binding.pry
    location = params[:location]
    weather_api_data = WeatherApiFacade.new.get_weather_now(location)
    render json: WeatherSerializer.format_current_weather(weather_api_data)
  end
end