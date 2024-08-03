class Api::V1::WeatherController < ApplicationController
  def forecast
    # require 'pry'; binding.pry
    location = params[:location]
    begin 
      today = WeatherApiFacade.new.get_weather_now(location)
      forecast = WeatherApiFacade.new.get_weather_forecast(location)
      hourly = WeatherApiFacade.new.get_weather_hourly(location)

      weather = WeatherApiFacade.new.get_weather_package(today, forecast, hourly)

      render json: WeatherSerializer.format_current_weather(weather)
    rescue => e
      render json: {error: e.message }, status: :unprocessable_entity
    end
  end
end