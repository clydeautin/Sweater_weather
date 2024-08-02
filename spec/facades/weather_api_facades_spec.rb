require "rails_helper"

RSpec.describe WeatherApiFacade do
  describe '#get_weather_now' do
    it 'returns info on current weather for a city' do
      location = "Paris"

      response = WeatherApiFacade.new.get_weather_now("Paris")

      expect(response).to be_a WeatherCurrent
    end
  end
end