require "rails_helper"

RSpec.describe RoadTripFacade do
  describe '#get_trip_details' do

    it 'returns travel time, and weather at eta' do
      from = 'New York, NY'
      to = 'Los Angeles, CA'

      response = RoadTripFacade.new.get_trip_details(from, to)
      # require 'pry'; binding.pry
      expect(response).to be_a Hash
      expect(response[:road_trip]).to be_a RoadTrip
      expect(response[:weather]).to be_a WeatherHourly

      expect(response[:road_trip].eta).to_not be nil
      expect(response[:road_trip].travel_time).to be_a String

      expect(response[:weather].temperature).to be_a Float
      expect(response[:weather].condition_text).to_not be nil
    end
  end
end