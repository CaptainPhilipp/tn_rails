class RelRailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route

  validates :railway_station, uniqueness: { scope: :route_id }
  validates :sort_key,        uniqueness: { scope: :route_id }

  before_save :set_sort_key

  def set_sort_key
    sort_key ||= self.class.where(route_id: route_id).max(:sort_key) + 1
  end
end
