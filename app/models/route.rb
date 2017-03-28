class Route < ApplicationRecord
  has_many :rel_railway_stations_routes
  has_many :railway_stations, through: :rel_railway_stations_routes
  has_many :trains

  validates :title, presence: true, length: { minimum: 2, maximum: 20 }

  alias stations railway_stations

  def set_sort_key(railway_station, sort_key)
    rel_railway_stations_routes
      .find_by(railway_station_id: railway_station.id)
      .update(sort_key: sort_key)
  end
end
