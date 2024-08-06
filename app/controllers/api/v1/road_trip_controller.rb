class Api::V1::RoadTripController < ApplicationController
  def create
    # require 'pry'; binding.pry
    origin = params[:origin]
    destination = params[:destination]
    begin 
      trip = RoadTripFacade.new.get_trip_details(origin, destination)

      render json: RoadTripSerializer.format_current_trip(trip, params)
    rescue StandardError => e
      render json: {error: e.message}, status: :unprocessable_entity
    end
  end
end