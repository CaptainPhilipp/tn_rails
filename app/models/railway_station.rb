class RailwayStation < ApplicationRecord
  has_many :rel_railway_stations_routes
  has_many :routes, through: :rel_railway_stations_routes
  has_many :trains, foreign_key: :current_station_id

  validates :title, presence: true, length: { minimum: 2, maximum: 20 }

  scope :ordered_by_route, -> do
    select('railway_stations.*, rel_railway_stations_routes.sort_key')
      .joins(:rel_railway_stations_routes)
      .order('rel_railway_stations_routes.sort_key').uniq
  end

  def sort_key_in(route)
    rel_railway_stations_route(route).sort_key
  end

  def change_sort_key_in(route, sort_key)
    rel_railway_stations_route(route).update(sort_key: sort_key)
  end

  private

  def rel_railway_stations_route(route)
    route = route.id if route.is_a? Route
    rel_railway_stations_routes.find_by(route_id: route)
  end
end
