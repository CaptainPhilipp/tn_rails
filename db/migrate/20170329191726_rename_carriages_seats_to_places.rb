class RenameCarriagesSeatsToPlaces < ActiveRecord::Migration[5.0]
  def change
    rename_column :carriages, :bottom_seats, :bottom_places
    rename_column :carriages, :top_seats, :top_places
    rename_column :carriages, :side_bottom_seats, :side_bottom_places
    rename_column :carriages, :side_top_seats, :side_top_places
  end
end
