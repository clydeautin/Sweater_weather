class WeatherApiService

  def self.conn 
    Faraday.new(url: "http://api.weatherapi.com") do |faraday|
    end
  end

  def self.get_current_weather(location)
    api_key = Rails.application.credentials.weather_api[:key]

    response = conn.get("/v1/forecast.json?key=#{api_key}&q=#{location}&aqi=no")

    JSON.parse(response.body, symbolize_names: true)
  end
end