class RenameColumnCarriagesCarriageTypeToType < ActiveRecord::Migration[5.0]
  def change
    rename_column :carriages, :carriage_type, :type
  end
end
