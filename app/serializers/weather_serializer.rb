class WeatherSerializer
  include JSONAPI::Serializer

  def self.format_current_weather(weather)
    {
      data: {
        id: nil,
        type: "forecast",
        attributes: {
          current_weather: {
            
            last_updated: weather.today.last_updated,
            temperature: weather.today.temperature,
            feels_like: weather.today.feels_like,
            humidity: weather.today.humidity,
            uvi: weather.today.uvi,
            visibility: weather.today.visibility,
            condition_text: weather.today.condition_text,
            condition_icon: weather.today.condition_icon
          },
          daily_weather: weather.forecast.map do |day|
            format_daily_weather(day)
          end,
          hourly_weather: weather.hourly.map do |hour|
            format_hourly_weather(hour)
          end,
        }
      }
    }
  end

  # def self.format_current_weather(today)
  #   {
  #     last_updated: today.last_updated,
  #     temperature: today.temperature,
  #     feels_like: today.feels_like,
  #     humidity: today.humidity,
  #     uvi: today.uvi,
  #     visibility: today.visibility,
  #     condition_text: today.condition_text,
  #     condition_icon: today.condition_icon
  #   }
  # end

  def self.format_daily_weather(forecast)
    {
      date: forecast.date,
      sunrise: forecast.sunrise,
      sunset: forecast.sunset,
      max_temp: forecast.max_temp,
      min_temp: forecast.min_temp,
      condition_text: forecast.condition_text,
      condition_icon: forecast.condition_icon
    }
  end

  def self.format_hourly_weather(hourly)
    {
      time: hourly.time,
      temperature: hourly.temperature,
      condition_text: hourly.condition_text,
      condition_icon: hourly.condition_icon
    }
  end
end