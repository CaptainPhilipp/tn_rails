class ChangeColumnTickets < ActiveRecord::Migration[5.0]
  def change
    add_index :tickets, :departure_id
    add_index :tickets, :arrival_id

    add_column :tickets, :passeneger_name,     :string
    add_column :tickets, :passeneger_document, :integer
  end
end
