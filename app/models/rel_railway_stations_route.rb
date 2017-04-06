class RelRailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route

  validates :railway_station, uniqueness: { scope: :route_id }
  validates :sort_key,        uniqueness: { scope: :route_id }

  before_validation :set_sort_key

  private

  def set_sort_key
    all = self.class.where(route_id: route_id).to_a
    all.delete self
    self.sort_key = all ? all.max(&:sort_key).sort_key + 1 : 0 unless sort_key
  end
end
