class AddSeatPlacesToCarriages < ActiveRecord::Migration[5.0]
  def change
    add_column :carriages, :seat_places, :integer, default: 0
  end
end
