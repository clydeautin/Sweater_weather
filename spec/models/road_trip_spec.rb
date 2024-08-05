require 'rails_helper'

RSpec.describe RoadTrip, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:origin)}
    it { should validate_presence_of(:destination)}
  end
end