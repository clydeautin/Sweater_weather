require "rails_helper"

RSpec.describe BookInfo do
  describe '#initialize' do
    it 'creates a BookInfo object withh the correct attributes' do
      json = {
        docs: [
          {
            isbn: [ "123542", "234482" ],
            title: "Photovoltaic safety, Denver, CO, 1988",
            publisher: ["American Institute of Physics", "Betts Creative"],
            cover_i: "452847",
            publish_date: ["Jan 30, 2006"]
          }
        ]
      }

      book = BookInfo.new(json[:docs][0])

      expect(book).to be_a BookInfo
      expect(book.isbn).to eq(["123542", "234482"])
      expect(book.title).to eq("Photovoltaic safety, Denver, CO, 1988")
      expect(book.publisher).to eq(["American Institute of Physics", "Betts Creative"])
      expect(book).to_not respond_to(:cover_i)
    end
  end
end