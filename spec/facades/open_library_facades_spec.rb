require "rails_helper"

RSpec.describe OpenLibraryFacade do
  describe '#get_5_books_from_search' do
    it 'returns book info' do
      search_terms = "Denver,CO"
    
      response = OpenLibraryFacade.new.get_books_from_search(search_terms)
    
      expect(response[0]).to be_a BookInfo
      expect(response[0].isbn).to be_a(Array)
      expect(response[0].title).to be_a(String)
      expect(response[0].publisher).to be_a(Array)
    end
  end

  describe '#get_num_books_found' do
    it 'returns details on a book search' do
      search_terms = "Denver,CO"
    
      response = OpenLibraryFacade.new.get_num_books_found(search_terms)
    
      expect(response).to be_a BookSearchDetails
      expect(response.num_found).to be_an(Integer)
    end
  end

  describe '#get_books_weather' do
    it 'combines 3 poros' do
      search_terms = "Denver,CO"
      quantity = 5

      weather_today = WeatherApiFacade.new.get_weather_now(search_terms)
      city_books = OpenLibraryFacade.new.get_books_from_search(search_terms).first(quantity)
      num_books = OpenLibraryFacade.new.get_num_books_found(search_terms)
    
      response = OpenLibraryFacade.new.get_books_weather(weather_today, city_books, num_books)
    
      expect(response).to be_a BookWeather

      expect(response.weather).to be_a WeatherCurrent
      expect(response.city_books).to all(be_a BookInfo)
      expect(response.num_found).to be_a BookSearchDetails
    end
  end
end