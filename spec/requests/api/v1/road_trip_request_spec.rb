require 'rails_helper'

RSpec.describe 'Road Trip Requests' do

  it 'can give back data for a road trip' do
    post "/api/v1/road_trip", params: { origin: "New York, NY", destination: "Los Angeles, CA" }

    expect(response.status).to eq(200)
  end

  it 'can give back data for a road trip even if road trip takes multiple days across countries' do
    post "/api/v1/road_trip", params: { origin: "New York, NY", destination: "Panama City, Panama" }

    expect(response.status).to eq(200)
  end

  it 'will not return data if road trip travel is impossible by land' do
    post "/api/v1/road_trip", params: { origin: "New York, NY", destination: "London, UK" }
    
    expect(response.status).to eq(422)
  end
end