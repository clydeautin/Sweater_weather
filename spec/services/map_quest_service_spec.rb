require "rails_helper"

RSpec.describe MapQuestService do
  describe '.get_directions' do
    it 'returns a hash' do
      from = 'New York, NY'
      to = 'Los Angeles, CA'

      directions = MapQuestService.get_directions(from, to)

      expect(directions).to be_a(Hash)
      expect(directions[:distance]).to be_a(Float)
      expect(directions[:formattedTime]).to be_present
    end
  end
end