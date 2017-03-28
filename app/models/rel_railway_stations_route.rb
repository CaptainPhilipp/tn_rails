class RelRailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route

  validates :railway_station, uniqueness: { scope: :route_id }
end
