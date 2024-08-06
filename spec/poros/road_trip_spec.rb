require 'rails_helper'

RSpec.describe RoadTrip do
  before(:each) do
    json = {
      formattedTime: "20:00:00",
      time: 72000
    }

    @road_trip = RoadTrip.new(json)
  end
  describe '#initialize' do
    it 'sets the travel_time' do
      expect(@road_trip.travel_time).to eq("20:00:00")
    end

    it 'calculates time_in_days' do
      expect(@road_trip.time_in_days).to eq(0)
    end
  end

    describe '#eta_calculator' do
    it 'calculates the correct arrival time' do
      allow(Time).to receive(:now).and_return(Time.new(2023, 1, 1, 10, 0, 0))
      expect(@road_trip.eta_calculator(72000)).to be_within(1).of(Time.new(2023, 1, 2, 6, 0, 0))
    end
  end

  describe '#days_traveled' do
    it 'calculates the correct number of days for less than a day' do
      expect(@road_trip.days_traveled(72000)).to eq(0)
    end

    it 'calculates the correct number of days for more than a day' do
      expect(@road_trip.days_traveled(172800)).to eq(2)
    end
  end

  describe '#hour_of_arrival_formatter' do
    it 'returns the correct hour' do
      time = Time.new(2023, 1, 1, 15, 30, 0)
      expect(@road_trip.hour_of_arrival_formatter(time)).to eq(15)
    end
  end
end