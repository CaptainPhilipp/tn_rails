class RailwayStation < ApplicationRecord
  has_many :rel_railway_stations_routes
  has_many :routes, through: :rel_railway_stations_routes
  has_many :trains, foreign_key: :current_station_id

  validates :title, presence: true, length: { minimum: 2, maximum: 20 }

  scope :ordered_by_route, lambda {
    select('railway_stations.*, rel_railway_stations_routes.sort_key')
      .joins(:rel_railway_stations_routes)
      .order('rel_railway_stations_routes.sort_key').distinct
  }

  def arrival_time_in(route)
    link_attribute(route, :arrival_time)
  end

  def departure_time_in(route)
    link_attribute(route, :departure_time)
  end

  def sort_key_in(route)
    link_attribute(route, :sort_key)
  end

  def rel_railway_stations_route(route)
    rel_railway_stations_routes.find_by(route_id: route_id(route))
  end

  private

  def link_attribute(route, attribute)
    link = rel_railway_stations_route(route)
    link ? link.send(attribute) : nil
  end

  def route_id(route)
    route.is_a?(Route) ? route.id : route
  end
end
