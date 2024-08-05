class OpenLibraryFacade
  def get_books_from_search(search_terms)
    json = OpenLibraryService.get_solr_search(search_terms)

    json[:docs].map do |book|
      BookInfo.new(book)
    end
  end
end