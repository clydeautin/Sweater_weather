class OpenLibraryService
  def self.conn
    Faraday.new(url: "https://openlibrary.org") do |faraday|
    end
  end

  def self.get_solr_search(search_terms)
    response = conn.get("/search.json?q=#{search_terms}")
    # require 'pry'; binding.pry

    JSON.parse(response.body, symbolize_names: true)
  end
end