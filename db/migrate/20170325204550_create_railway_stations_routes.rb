class CreateRailwayStationsRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :railway_stations_routes do |t|
      t.references :railway_station, foreign_key: true, index: true
      t.references :route,           foreign_key: true, index: true
    end
  end
end
