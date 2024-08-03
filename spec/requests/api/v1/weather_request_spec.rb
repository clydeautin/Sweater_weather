require 'rails_helper'

RSpec.describe 'Weather API' do 
  before(:each) do
    base_url = "http://api.weatherapi.com"

    json_response_paris_1day = File.read('spec/fixtures/paris_weather_today.json')
    api_key = Rails.application.credentials.weather_api[:key]
    location = "Paris"

    stub_request(:get, "#{base_url}/v1/forecast.json?key=#{api_key}&q=#{location}&aqi=no")
      .to_return(status: 200, body: json_response_paris_1day, headers: { 'Content-Type' => 'application/json' } )
  end

  describe '#forecast' do
    it "sends weather details for a specific location" do

      get "/api/v1/forecast", params: { location: "paris" }

      # require 'pry'; binding.pry
      weather_details = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)

      expect(weather_details).to have_key(:data)
      data = weather_details[:data]
      expect(data).to have_key(:id)
      expect(data).to have_key(:type)
      expect(data).to have_key(:attributes)

      attributes = data[:attributes]
      expect(attributes).to have_key(:last_updated)
      expect(attributes).to have_key(:temperature)
      expect(attributes).to have_key(:feels_like)
      expect(attributes).to have_key(:humidity)
      expect(attributes).to have_key(:uvi)
      expect(attributes).to have_key(:visibility)
      expect(attributes).to have_key(:condition_text)
      expect(attributes).to have_key(:condition_icon)
    end
  end
end