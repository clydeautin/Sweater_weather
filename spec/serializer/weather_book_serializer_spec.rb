require 'rails_helper'

RSpec.describe WeatherBookSerializer do
  describe '.format_city_books' do
    it 'correctly formats city books and weather data' do
      # Sample data
      weather = {
        current: {
          temp_f: 72.5,
          last_updated: "2023-08-03 15:30",
          condition: {
            text: "Partly cloudy",
            icon: "//cdn.weatherapi.com/weather/64x64/day/116.png"
          },
          feelslike_f: 71.2,
          uv: 5,
          vis_miles: 6,
          humidity: 65
        },
        location: { 
          name: "Denver"
        }
      }

      weather_current = WeatherCurrent.new(weather)

      books = [
        BookInfo.new(isbn: "1234567890", title: "Book One", publisher: "Publisher A"),
        BookInfo.new(isbn: "0987654321", title: "Book Two", publisher: "Publisher B")
      ]

      num_books = BookSearchDetails.new(num_found: 2)

      books_n_weather = OpenLibraryFacade.new.get_books_weather(weather_current, books, num_books)

      serialized_data = WeatherBookSerializer.format_city_books(books_n_weather)
        # require 'pry'; binding.pry

      expected_output = {
        data: {
          id: nil,
          type: "books",
          attributes: {
            destination: "Denver",
            forecast: {
              summary: "Partly cloudy",
              temperature: "72.5 F"
            },
            total_books_found: 2,
            books: [
              { isbn: "1234567890", title: "Book One", publisher: "Publisher A" },
              { isbn: "0987654321", title: "Book Two", publisher: "Publisher B" }
            ]
          }
        }
      }

      expect(serialized_data).to eq(expected_output)
    end
  end
end