class OpenLibraryService
  def self.conn
    Faraday.new(url: "https://openlibrary.org") do |faraday|
    end
  end

  def self.get_solr_search(search_terms)
    response = conn.get("/search.json?q=#{search_terms}")


    JSON.parse(response.body, symbolize_names: true)
  end
  # def self.get_solr_search(search_terms, quantity)
  #   response = conn.get("/search.json?q=#{search_terms}&limit=#{quantity}")
  #   # require 'pry'; binding.pry

  #   JSON.parse(response.body, symbolize_names: true)
  # end
end