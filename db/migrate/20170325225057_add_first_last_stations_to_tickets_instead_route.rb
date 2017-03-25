class AddFirstLastStationsToTicketsInsteadRoute < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :departure_id, :integer
    add_column :tickets, :arrival_id, :integer
    add_foreign_key :tickets, :railway_stations, column: :departure_id
    add_foreign_key :tickets, :railway_stations, column: :arrival_id

    Ticket.all.each do |t|
      t.departure_id = t.route.stations.first.id
      t.arrival_id = t.route.stations.last.id
    end

    remove_reference :tickets, :route, foreign_key: true, index: true
  end
end
