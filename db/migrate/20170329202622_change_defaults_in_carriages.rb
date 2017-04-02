class ChangeDefaultsInCarriages < ActiveRecord::Migration[5.0]
  def change
    change_column_default :carriages, :bottom_places, 0
    change_column_default :carriages, :top_places, 0
    change_column_default :carriages, :side_bottom_places, 0
    change_column_default :carriages, :side_top_places, 0
  end
end
