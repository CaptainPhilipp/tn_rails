class Route < ApplicationRecord
  has_and_belongs_to_many :railway_stations

  validates :title, presence: true, length: { minimum: 2, maximum: 20 }
end
