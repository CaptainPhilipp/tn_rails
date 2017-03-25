class AddRailwayStationRefToTrains < ActiveRecord::Migration[5.0]
  def change
    add_reference :trains, :railway_station, foreign_key: true
  end
end
