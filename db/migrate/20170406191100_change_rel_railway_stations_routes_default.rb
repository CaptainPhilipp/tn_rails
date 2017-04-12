class ChangeRelRailwayStationsRoutesDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default :rel_railway_stations_routes, :sort_key, 0
  end
end
