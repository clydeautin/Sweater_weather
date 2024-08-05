class RoadTrip < ApplicationRecord
  validates :origin, presence: true
  validates :destination, presence: true
end