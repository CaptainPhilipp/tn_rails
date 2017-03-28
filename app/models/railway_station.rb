class RailwayStation < ApplicationRecord
  has_many :rel_railway_stations_routes
  has_many :routes, through: :rel_railway_stations_routes
  has_many :trains, foreign_key: :current_station_id

  validates :title, presence: true, length: { minimum: 2, maximum: 20 }

  def set_sort_key(route, sort_key)
    rel_railway_stations_routes
      .find_by(route_id: route.id)
      .update(sort_key: sort_key)
  end
end
