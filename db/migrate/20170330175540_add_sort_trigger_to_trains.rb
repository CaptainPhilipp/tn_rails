class AddSortTriggerToTrains < ActiveRecord::Migration[5.0]
  def change
    add_column :trains, :reverse_cars_sort, :boolean, default: false
  end
end
