class RoadTripFacade
  def get_trip_details(from, to)
    json = MapQuestService.get_directions(from, to)
    trip = RoadTrip.new(json)

    weather_json = WeatherApiService.get_forecast_5(to)
    arrival_time_weather = weather_json[:forecast][:forecastday][trip.time_in_days - 1][:hour][trip.hour_of_arrival]
    weather_on_arrival = WeatherHourly.new(arrival_time_weather)
    road_trip_with_weather = { road_trip: trip, weather: weather_on_arrival}
    # require 'pry'; binding.pry
  end
end