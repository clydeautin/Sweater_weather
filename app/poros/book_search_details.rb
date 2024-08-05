class BookSearchDetails
  attr_reader :num_found

  def initialize(json)
    @num_found = json[:num_found]
  end
end