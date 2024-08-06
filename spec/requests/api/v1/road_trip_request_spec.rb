require 'rails_helper'

RSpec.describe 'Road Trip Requests' do

  it 'can give back data for a road trip' do
    post "/api/v1/road_trip", params: { origin: "New York, NY", destination: "Los Angeles, CA", api_key: User.last.api_key }

    expect(response.status).to eq(200)
          
    json = JSON.parse(response.body, symbolize_names: true)
      
    expect(json[:data]).to be_a(Hash)
    expect(json[:data][:id]).to eq(nil)
    expect(json[:data][:type]).to eq('road_trip')
    expect(json[:data][:attributes]).to be_a(Hash)
    
    attributes = json[:data][:attributes]
    expect(attributes[:start_city]).to eq('New York, NY')
    expect(attributes[:end_city]).to eq('Los Angeles, CA')
    expect(attributes[:travel_time]).to be_a(String)
    expect(attributes[:travel_time]).not_to be_empty
    
    expect(attributes[:weather_at_eta]).to be_a(Hash)
    expect(attributes[:weather_at_eta][:temperature]).to be_a(Numeric)
    expect(attributes[:weather_at_eta][:condition]).to be_a(String)
  end

  it 'can give back data for a road trip even if road trip takes multiple days across countries' do
    post "/api/v1/road_trip", params: { origin: "New York, NY", destination: "Panama City, Panama", api_key: User.last.api_key }

    expect(response.status).to eq(200)

    json = JSON.parse(response.body, symbolize_names: true)
      
    expect(json[:data][:attributes][:start_city]).to eq('New York, NY')
    expect(json[:data][:attributes][:end_city]).to eq('Panama City, Panama')
    expect(json[:data][:attributes][:travel_time]).to be_a(String)
    expect(json[:data][:attributes][:travel_time]).not_to be_empty

    expect(json[:data][:attributes][:weather_at_eta]).to be_a(Hash)
    expect(json[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Numeric)
    expect(json[:data][:attributes][:weather_at_eta][:condition]).to be_a(String)
  end

  it 'will not return data if road trip travel is impossible by land' do
    post "/api/v1/road_trip", params: { origin: "New York, NY", destination: "London, UK", api_key: User.last.api_key }
    
    expect(response.status).to eq(422)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:error]).to eq("Routing is impossible: We are unable to route with the given locations.")
  end
end