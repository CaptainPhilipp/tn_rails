class RelRailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route

  validates :railway_station, uniqueness: { scope: :route_id }
  validates :sort_key,        uniqueness: { scope: :route_id }
  validate :stations_count

  before_save :set_sort_key

  def set_sort_key
    sort_key ||= self.class.where(route_id: route_id).max(:sort_key) + 1
  end

  private

  def stations_count
    return true if railway_stations.count >= 2
    errors.add(:base, 'Should contain more than one station')
  end
end
