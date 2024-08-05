class BookInfo
  attr_reader :isbn, :title, :publisher

  def initialize(json)
    @isbn = json[:isbn]
    @title = json[:title]
    @publisher = json[:publisher]
  end

end