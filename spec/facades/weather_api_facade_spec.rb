require "rails_helper"

RSpec.describe WeatherApiFacade do
  describe '#get_weather_now' do
    it 'returns info on current weather for a city' do
      location = "Paris"

      response = WeatherApiFacade.new.get_weather_now(location)

      expect(response).to be_a WeatherCurrent
    end
  end

  describe '#get_weather_forecast' do
    it 'returns info on current weather for a city' do
      location = "Paris"

      response = WeatherApiFacade.new.get_weather_forecast(location)
      expect(response).to be_a Array
      expect(response[0]).to be_a WeatherForecast
      expect(response.count).to eq 5
    end
  end

  describe '#get_weather_hourly' do
    it 'returns weather info on each hour for a specified city' do
      location = "Paris"

      response = WeatherApiFacade.new.get_weather_hourly(location)
      expect(response).to be_a Array
      expect(response[0]).to be_a WeatherHourly
      expect(response.count).to eq 24
    end
  end

  describe '#get_weather_package' do
  it 'returns a Weather object containing current, forecast, and hourly weather' do
    facade = WeatherApiFacade.new
    location = "Paris"

    # Mock the other methods to return appropriate objects
    today = instance_double(WeatherCurrent)
    forecast = [instance_double(WeatherForecast), instance_double(WeatherForecast)]
    hourly = [instance_double(WeatherHourly), instance_double(WeatherHourly)]

    allow(facade).to receive(:get_weather_now).with(location).and_return(today)
    allow(facade).to receive(:get_weather_forecast).with(location).and_return(forecast)
    allow(facade).to receive(:get_weather_hourly).with(location).and_return(hourly)

    weather_package = facade.get_weather_package(today, forecast, hourly)

    expect(weather_package).to be_a Weather
    expect(weather_package.today).to eq today
    expect(weather_package.forecast).to eq forecast
    expect(weather_package.hourly).to eq hourly
  end
end
end