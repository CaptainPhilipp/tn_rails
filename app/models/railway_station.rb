class RailwayStation < ApplicationRecord
  has_many :rel_railway_stations_routes
  has_many :routes, through: :rel_railway_stations_routes
  has_many :trains

  validates :title, presence: true, length: { minimum: 2, maximum: 20 }
end
