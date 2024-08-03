require 'rails_helper'

RSpec.describe WeatherForecast do
  describe '#initialize' do
    it 'creates a WeatherForecast object with the correct attributes' do
      data = {
        date: "2023-08-03",
        astro: {
          sunrise: "06:15 AM",
          sunset: "08:30 PM"
        },
        day: {
          maxtemp_f: 85.6,
          mintemp_f: 68.2,
          condition: {
            text: "Sunny",
            icon: "//cdn.weatherapi.com/weather/64x64/day/113.png"
          }
        }
      }

      weather_forecast = WeatherForecast.new(data)

      expect(weather_forecast).to be_a WeatherForecast
      expect(weather_forecast.date).to eq("2023-08-03")
      expect(weather_forecast.sunrise).to eq("06:15 AM")
      expect(weather_forecast.sunset).to eq("08:30 PM")
      expect(weather_forecast.max_temp).to eq(85.6)
      expect(weather_forecast.min_temp).to eq(68.2)
      expect(weather_forecast.condition_text).to eq("Sunny")
      expect(weather_forecast.condition_icon).to eq("//cdn.weatherapi.com/weather/64x64/day/113.png")
    end
  end
end
