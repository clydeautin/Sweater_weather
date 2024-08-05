class WeatherBookSerializer
  include JSONAPI::Serializer

  def self.format_city_books(books_n_weather)
    {
      data: {
        id: nil,
        type: "books",
        attributes: {
          destination: books_n_weather.weather.location,
          forecast: {
            summary: books_n_weather.weather.condition_text,
            temperature: books_n_weather.weather.temperature
          },
          total_books_found: books_n_weather.num_found.num_found,
          books: books_n_weather.city_books.map do |book|
            format_books(book)
          end
        }
      }
    }
  end

  def self.format_books(book)
    {
      isbn: book.isbn,
      title: book.title,
      publisher: book.publisher
    }
  end
end