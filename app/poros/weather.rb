class Weather
  attr_reader :today, :forecast, :hourly

  def initialize(today, forecast, hourly)
    @today = today
    @forecast = forecast
    @hourly = hourly
  end
end