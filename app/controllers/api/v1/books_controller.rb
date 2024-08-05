class Api::V1::BooksController < ApplicationController
  def search
    location = params[:location]
    quantity = params[:quantity].to_i

    weather_today = WeatherApiFacade.new.get_weather_now(location)
    city_books = OpenLibraryFacade.new.get_books_from_search(location).first(quantity)
    num_books = OpenLibraryFacade.new.get_num_books_found(location)

    books_n_weather = OpenLibraryFacade.new.get_books_weather(weather_today, city_books, num_books)

    render json: WeatherBookSerializer.format_city_books(books_n_weather)
  end
end