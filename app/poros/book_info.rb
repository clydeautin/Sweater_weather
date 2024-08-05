class BookInfo
  attr_reader :isbn, :title, :publisher, :total_books_found

  def initialize(json)
    @isbn = json[:isbn]
    @title = json[:title]
    @publisher = json[:publisher]
  end

end