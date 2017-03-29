class RailwayStation < ApplicationRecord
  has_many :rel_railway_stations_routes
  has_many :routes, through: :rel_railway_stations_routes
  has_many :trains, foreign_key: :current_station_id

  validates :title, presence: true, length: { minimum: 2, maximum: 20 }

  # необходимо наличие роута в запросе.
  # Пример:
  #   @route.stations.order_by_route_sort_key
  # Или:
  #   RailwayStation.order_by_route_sort_key(@route)
  scope :order_by_route_sort_key, -> (route = nil) do
    if route
      joins(:rel_railway_stations_routes).
        where('rel_railway_stations_routes.route_id' => route.id).
        order('rel_railway_stations_routes.sort_key')
    else
      order('rel_railway_stations_routes.sort_key')
    end
  end

  def set_sort_key(route, sort_key)
    rel_railway_stations_routes.
      find_by(route_id: route.id).
      update(sort_key: sort_key)
  end
end
