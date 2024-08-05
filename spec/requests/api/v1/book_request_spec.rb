require "rails_helper"

RSpec.describe "Book API" do
  describe '#weather_and_books' do
    it 'returns weather for a city and a set number of books for that city' do
      get "/api/v1/book-search?location=denver,co&quantity=5"

      city_books = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(city_books).to have_key(:data)
    end
  end
end