require 'rails_helper'

RSpec.describe WeatherHourly do
  describe '#initialize' do
    it 'creates a WeatherHourly object with the correct attributes' do
      json = {
          time: "2024-08-02 00:00",
          temp_f: 71.5,
          condition: {
            text: "Partly cloudy",
            icon: "//cdn.weatherapi.com/weather/64x64/day/116.png"
          },
      }

      weather_hourly = WeatherHourly.new(json)

      expect(weather_hourly).to be_a WeatherHourly
      expect(weather_hourly.time).to eq("00:00")
      expect(weather_hourly.temperature).to eq(71.5)
      expect(weather_hourly.condition_text).to eq("Partly cloudy")
      expect(weather_hourly.condition_icon).to eq("//cdn.weatherapi.com/weather/64x64/day/116.png")
    end
  end
end