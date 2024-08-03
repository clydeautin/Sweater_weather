require "rails_helper"

RSpec.describe WeatherApiService do
  before(:each) do
  end
  describe '.get_current_weather' do
    it 'returns a hash' do
      base_url = "http://api.weatherapi.com"
    
      json_response_paris_1day = File.read('spec/fixtures/paris_weather_today.json')
      api_key = Rails.application.credentials.weather_api[:key]
      location = "Paris"
    
      stub_request(:get, "#{base_url}/v1/forecast.json?key=#{api_key}&q=#{location}&aqi=no")
        .to_return(status: 200, body: json_response_paris_1day, headers: { 'Content-Type' => 'application/json' } )
      
      location = "Paris"

      weather_deets = WeatherApiService.get_current_weather(location)

      expect(weather_deets).to be_a(Hash)
    end
  end

  describe '.get_daily_weather_5' do
    it 'returns info weather info for a city for 5 days' do
      base_url = "http://api.weatherapi.com"
    
      json_response_paris_5days = File.read('spec/fixtures/paris_weather_5days.json')
      api_key = Rails.application.credentials.weather_api[:key]
      location = "Paris"
      days = 5
    
      stub_request(:get, "#{base_url}/v1/forecast.json?key=#{api_key}&q=#{location}&days=#{days}&aqi=no&alerts=no")
        .to_return(status: 200, body: json_response_paris_5days, headers: { 'Content-Type' => 'application/json' } )
      
      location = "Paris"

      weather_details = WeatherApiService.get_forecast_5(location)

      expect(weather_details).to be_a(Hash)
    end
  end
end