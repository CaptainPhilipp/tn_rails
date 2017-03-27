class RenameCarriagesTypeToCarriageType < ActiveRecord::Migration[5.0]
  def change
    rename_column :carriages, :type, :carriage_type
  end
end
