class BookWeather
  attr_reader :weather, :city_books, :num_found

  def initialize(weather, city_books, num_found)
    @weather = weather
    @city_books = city_books
    @num_found = num_found
  end
end