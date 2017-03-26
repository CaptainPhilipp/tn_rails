class RelRailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route
end
