class AddIndexToTrains < ActiveRecord::Migration[5.0]
  def change
    add_index :trains, :route_id
  end
end
