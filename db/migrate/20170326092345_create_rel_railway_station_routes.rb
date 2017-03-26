class CreateRelRailwayStationRoutes < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :railway_stations_routes, :railway_stations
    remove_foreign_key :railway_stations_routes, :routes
    rename_table :railway_stations_routes, :rel_railway_stations_routes
    add_foreign_key :rel_railway_stations_routes, :railway_stations
    add_foreign_key :rel_railway_stations_routes, :routes
  end
end
