class CreateCarriages < ActiveRecord::Migration[5.0]
  def change
    create_table :carriages do |t|
      t.integer :number
      t.references :train, foreign_key: true
      t.integer :bottom_seats
      t.integer :top_seats
      t.string :type

      t.timestamps
    end
  end
end
