require "rails_helper"

RSpec.describe WeatherApiFacade do
  describe '#get_weather_now' do
    it 'returns info on current weather for a city' do
      location = "Paris"

      response = WeatherApiFacade.new.get_weather_now("Paris")

      expect(response).to be_a WeatherCurrent
    end
  end

  describe '#get_weather_forecast' do
    it 'returns info on current weather for a city' do
      location = "Paris"

      response = WeatherApiFacade.new.get_weather_forecast("Paris")
      expect(response).to be_a Array
      expect(response[0]).to be_a WeatherForecast
      expect(response.count).to eq 5
    end
  end

  describe '#get_weather_hourly' do
    it 'returns weather info on each hour for a specified city' do
      location = "Paris"

      response = WeatherApiFacade.new.get_weather_hourly("Paris")
      expect(response).to be_a Array
      expect(response[0]).to be_a WeatherHourly
      expect(response.count).to eq 24
    end
  end
end