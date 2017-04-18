class RenameColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :tickets, :passeneger_name, :passenger_name
    rename_column :tickets, :passeneger_document, :passenger_document
  end
end
