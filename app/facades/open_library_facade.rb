class OpenLibraryFacade
  def get_books_from_search(search_terms)
    json = OpenLibraryService.get_solr_search(search_terms)

    json[:docs].map do |book|
      BookInfo.new(book)
    end
  end
  
  def get_num_books_found(search_terms)
    json = OpenLibraryService.get_solr_search(search_terms)
    BookSearchDetails.new(json)
  end

  def get_books_weather(weather, city_books, num_found)
    BookWeather.new(weather, city_books, num_found)
  end
end