require "rails_helper"

RSpec.describe OpenLibraryFacade do
  describe '#get_5_books_from_search' do
    it 'returns book info' do
      search_terms = "Denver,CO"
    
      response = OpenLibraryFacade.new.get_books_from_search(search_terms)
    
      expect(response[0]).to be_a BookInfo
    end
  end
end