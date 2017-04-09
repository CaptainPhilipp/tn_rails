class Route < ApplicationRecord
  has_many :rel_railway_stations_routes
  has_many :railway_stations, through: :rel_railway_stations_routes
  has_many :trains

  accepts_nested_attributes_for :rel_railway_stations_routes

  validates :title, presence: true, length: { minimum: 2, maximum: 20 }
  validate :stations_count

  alias stations railway_stations

  def ordered_stations
    railway_stations.order('rel_railway_stations_routes.sort_key')
  end

  def change_sort_key(railway_station, sort_key)
    rel_railway_stations_routes
      .find_by(railway_station_id: railway_station.id)
      .update(sort_key: sort_key)
  end

  def stations_count
    return true if railway_stations.count >= 2
    errors.add(:base, 'Should contain more than one station')
  end

  # определение условий в JOIN вместо WHERE примерно в двое быстрее. Но это не точно
  def self.relevant(departure_id, arrival_id)
    select('routes.*, a.railway_station_id, b.railway_station_id')
      .joins('JOIN rel_railway_stations_routes AS a ON a.route_id = routes.id ')
      .joins('JOIN rel_railway_stations_routes AS b ON ' \
             'a.railway_station_id = ? AND ' \
             'b.railway_station_id = ? AND ' \
             'b.route_id = routes.id ', departure_id, arrival_id)
      .where('a.sort_key < b.sort_key')
  end
end
