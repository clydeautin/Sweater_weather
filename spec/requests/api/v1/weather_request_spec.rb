require 'rails_helper'

RSpec.describe 'Weather API' do 
  # before(:each) do
  #   base_url = "http://api.weatherapi.com"

  #   json_response_paris_1day = File.read('spec/fixtures/paris_weather_today.json')
  #   api_key = Rails.application.credentials.weather_api[:key]
  #   location = "Paris"

  #   stub_request(:get, "#{base_url}/v1/forecast.json?key=#{api_key}&q=#{location}&aqi=no")
  #     .to_return(status: 200, body: json_response_paris_1day, headers: { 'Content-Type' => 'application/json' } )
  # end


  describe '#weather_and_books' do
    it 'returns weather for a city and a set number of books for that city' do
      get "/api/v1/book-search", params: { location: "denver,co", quantity: "5" }

      city_books = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(city_books).to have_key(:data)
    end
  end

  describe '#forecast' do
    it "sends weather details for a specific location" do

      get "/api/v1/forecast", params: { location: "paris" }


      weather_details = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)

      expect(weather_details).to have_key(:data)
      data = weather_details[:data]
      expect(data).to have_key(:id)
      expect(data).to have_key(:type)
      expect(data).to have_key(:attributes)

      today_attributes = data[:attributes][:current_weather]
      expect(today_attributes).to have_key(:last_updated)
      expect(today_attributes).to have_key(:temperature)
      expect(today_attributes).to have_key(:feels_like)
      expect(today_attributes).to have_key(:humidity)
      expect(today_attributes).to have_key(:uvi)
      expect(today_attributes).to have_key(:visibility)
      expect(today_attributes).to have_key(:condition_text)
      expect(today_attributes).to have_key(:condition_icon)
      
      forecast_attributes = data[:attributes][:daily_weather][0]
      expect(forecast_attributes).to have_key(:date)
      expect(forecast_attributes).to have_key(:sunrise)
      expect(forecast_attributes).to have_key(:sunset)
      expect(forecast_attributes).to have_key(:max_temp)
      expect(forecast_attributes).to have_key(:min_temp)
      expect(forecast_attributes).to have_key(:condition_text)
      expect(forecast_attributes).to have_key(:condition_icon)

      expect(data[:attributes][:daily_weather].count).to eq 5
      
      hourly_attributes = data[:attributes][:hourly_weather][0]
      expect(hourly_attributes).to have_key(:time)
      expect(hourly_attributes).to have_key(:temperature)
      expect(hourly_attributes).to have_key(:condition_text)
      expect(hourly_attributes).to have_key(:condition_icon)
      
      expect(data[:attributes][:hourly_weather].count).to eq 24
      
    end
  end
end