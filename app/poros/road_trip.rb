class RoadTrip
  attr_reader :travel_time, :eta, :time_in_days, :hour_of_arrival

  def initialize(json)
    @travel_time = json[:formattedTime]
    @time_in_s = json[:time]
    @time_in_days = days_traveled(@time_in_s)
    @eta = eta_calculator(@time_in_s)
    # require 'pry'; binding.pry
    @hour_of_arrival = hour_of_arrival_formatter(@eta)
  end

  def eta_calculator(time_of_travel)
    current_time = Time.now
    arrival_time = current_time + time_of_travel
    arrival_time
  end

  def days_traveled(time_of_travel)
    days = time_of_travel / 86400
    days.truncate
  end

  def hour_of_arrival_formatter(eta_string)
    eta_string.hour
  end
end