class WeatherApiFacade
  def get_weather_now(location)
    json = WeatherApiService.get_current_weather(location)
    WeatherCurrent.new(json)
  end
end