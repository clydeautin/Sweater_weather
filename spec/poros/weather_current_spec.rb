require 'rails_helper'

RSpec.describe WeatherCurrent do
  describe '#initialize' do
    it 'creates a WeatherCurrent object with the correct attributes' do
      json = {
        current: {
          temp_f: 72.5,
          last_updated: "2023-08-03 15:30",
          condition: {
            text: "Partly cloudy",
            icon: "//cdn.weatherapi.com/weather/64x64/day/116.png"
          },
          feelslike_f: 71.2,
          uv: 5,
          vis_miles: 6,
          humidity: 65
        }
      }

      weather_current = WeatherCurrent.new(json)

      expect(weather_current).to be_a WeatherCurrent
      expect(weather_current.temperature).to eq(72.5)
      expect(weather_current.last_updated).to eq("2023-08-03 15:30")
      expect(weather_current.condition_text).to eq("Partly cloudy")
      expect(weather_current.condition_icon).to eq("//cdn.weatherapi.com/weather/64x64/day/116.png")
      expect(weather_current.feels_like).to eq(71.2)
      expect(weather_current.uvi).to eq(5)
      expect(weather_current.visibility).to eq(6)
      expect(weather_current.humidity).to eq(65)
    end
  end
end