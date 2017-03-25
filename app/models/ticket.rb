class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :train
  belongs_to :route

  def departure_station
    route.railway_stations.first
  end

  def arrival_station
    route.railway_stations.last
  end
end
