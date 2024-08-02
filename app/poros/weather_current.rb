class WeatherCurrent
  attr_reader :temp_f,
              :last_updated,
              :condition_text,
              :condition_icon,
              :feels_like_temp_f,
              :uv,
              :visibility_miles,
              :humidity

  def initialize(json)
    @temp_f = json[:current][:temp_f]
    @last_updated = json[:current][:last_updated]
    @condition_text = json[:current][:condition][:text]
    @condition_icon = json[:current][:condition][:icon]
    @feels_like_f = json[:current][:feels_like_f]
    @uv = json[:current][:uv]
    @visibility_miles = json[:current][:vis_miles]
    @humidity = json[:current][:humidity]
  end
end