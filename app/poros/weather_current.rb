class WeatherCurrent
  attr_reader :temperature,
              :last_updated,
              :condition_text,
              :condition_icon,
              :feels_like,
              :uvi,
              :visibility,
              :humidity

  def initialize(json)
    @temperature = json[:current][:temp_f]
    @last_updated = json[:current][:last_updated]
    @condition_text = json[:current][:condition][:text]
    @condition_icon = json[:current][:condition][:icon]
    @feels_like = json[:current][:feelslike_f]
    @uvi = json[:current][:uv]
    @visibility = json[:current][:vis_miles]
    @humidity = json[:current][:humidity]
  end
end