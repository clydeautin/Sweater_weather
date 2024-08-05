require "rails_helper"

RSpec.describe OpenLibraryService do

  describe '.get_solr_search' do
    it 'returns books related to my search terms' do
      # base_url = 'https://openlibrary.org'

      # json_response_lotr = File.read('spec/services/open_library_service_spec.rb')

      search_terms = 'lord+of+the+rings'

      # stub_request(:get, "#{base_url}/search.json?q=#{search_terms}")
      #   .to_return(status: 200, body: json_response_lotr, headers: { 'Content-Type' => 'application/json' } )

      search_results = OpenLibraryService.get_solr_search(search_terms)

      expect(search_results).to be_a(Hash)
      expect(search_results[:numFound]).to eq(742)
      expect(search_results[:numFoundExact]).to be(true)

    end
    # it 'returns books related to my search terms' do

    #   search_terms = 'Denver, CO'
    # quantity = 5


    #   search_results = OpenLibraryService.get_solr_search(search_terms, quantity)

    #   expect(search_results).to be_a(Hash)
    #   expect(search_results[:numFound]).to eq(742)
    #   expect(search_results[:numFoundExact]).to be(true)

    # end
  end
end