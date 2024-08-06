class RoadTripSerializer
  include JSONAPI::Serializer

  def self.format_current_trip(trip_details, params)

    {
      data: {
        id: nil,
        type: "road_trip",
        attributes: {
          start_city: params[:origin],
          end_city: params[:destination],
          travel_time: trip_details[:road_trip].travel_time,
          weather_at_eta: {
            datetime: trip_details[:road_trip].eta,
            temperature: trip_details[:weather].temperature,
            condition: trip_details[:weather].condition_text
          }
        }
      }
    }
  end
end