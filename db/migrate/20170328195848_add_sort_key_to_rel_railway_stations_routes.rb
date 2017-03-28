class AddSortKeyToRelRailwayStationsRoutes < ActiveRecord::Migration[5.0]
  def change
    add_column :rel_railway_stations_routes, :sort_key, :integer, default: 10
  end
end
