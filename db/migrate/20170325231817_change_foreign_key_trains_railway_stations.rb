class ChangeForeignKeyTrainsRailwayStations < ActiveRecord::Migration[5.0]
  def up
    remove_foreign_key :trains, :railway_stations
    rename_column :trains, :railway_station_id, :current_station_id
    add_foreign_key :trains, :railway_stations, column: :current_station_id
  end

  def down
    remove_foreign_key :trains, :railway_stations, column: :current_station_id
    rename_column :trains, :current_station_id, :railway_station_id
    add_foreign_key :trains, :railway_stations
  end
end
