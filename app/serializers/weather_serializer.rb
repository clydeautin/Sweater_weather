class WeatherSerializer
  include JSONAPI::Serializer
  attributes :temperature, 
              :last_updated,
              :condition_text,
              :condition_icon,
              :feels_like,
              :uv,
              :visibility,
              :humidity

  def self.format_current_weather(location)
    {
      data: {
        id: nil,
        type: "forecast",
        attributes: {
          last_updated: location.last_updated,
          temperature: location.temp_f,
          feels_like: location.feels_like,
          humidity: location.humidity,
          uvi: location.uvi,
          visibility: location.visibility_miles,
          condition_text: location.condition_text,
          condition_icon: location.condition_icon
        }
      }
    }
  end
end