class AddDepartureTimeToToRelRailwayStationsRoutes < ActiveRecord::Migration[5.0]
  def change
    add_column :rel_railway_stations_routes, :departure_time, :time
    add_column :rel_railway_stations_routes, :arrival_time, :time
  end
end
