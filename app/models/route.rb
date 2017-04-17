class Route < ApplicationRecord
  has_many :rel_railway_stations_routes, dependent: :destroy
  has_many :railway_stations, through: :rel_railway_stations_routes
  has_many :trains

  accepts_nested_attributes_for :rel_railway_stations_routes

  validates :title, presence: true, length: { minimum: 2, maximum: 20 }

  alias stations railway_stations

  def ordered_stations
    railway_stations.order('rel_railway_stations_routes.sort_key')
  end

  def change_sort_key(railway_station, sort_key)
    rel_railway_stations_routes
      .find_by(railway_station_id: railway_station.id)
      .update(sort_key: sort_key)
  end
end
