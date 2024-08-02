require "rails_helper"

RSpec.describe WeatherApiService do
  before(:each) do
    @base_url = "http://api.weatherapi.com/v1"

    @json_response_paris_1day = File.read('spec/fixtures/paris_weather_today.json')

    stub_request(:get, "#{@base_url}/current/json")
      .with(querry: { q: "Paris" })
      .to_return(status: 200, body: @json_response_paris_1day, headers: { 'Content-Type' => 'application/json' } )
  end
  describe '.get_current_weather' do
    it 'returns a hash' do
      location = "Paris"

      weather_deets = WeatherApiService.get_current_weather(location)

      expect(weather_deets).to be_a(Hash)
    end
  end
end