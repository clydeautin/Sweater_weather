require 'rails_helper'

RSpec.describe 'Road Trip Requests' do

  it 'can give back data for a road trip' do
    post "/api/v1/road_trip", params: { origin: "Cincinatti, OH", destination: "Chicago, IL" }
    expect(response.status).to eq(200)
  end
end