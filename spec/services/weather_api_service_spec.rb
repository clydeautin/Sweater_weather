require "rails_helper"

RSpec.describe WeatherApiService do
  before(:each) do
    base_url = "http://api.weatherapi.com"

    json_response_paris_1day = File.read('spec/fixtures/paris_weather_today.json')
    api_key = Rails.application.credentials.weather_api[:key]
    location = "Paris"

    stub_request(:get, "#{base_url}/v1/forecast.json?key=#{api_key}&q=#{location}&aqi=no")
      .to_return(status: 200, body: json_response_paris_1day, headers: { 'Content-Type' => 'application/json' } )
  end
  describe '.get_current_weather' do
    it 'returns a hash' do
      location = "Paris"

      weather_deets = WeatherApiService.get_current_weather(location)
      require 'pry'; binding.pry
      expect(weather_deets).to be_a(Hash)
    end
  end
end