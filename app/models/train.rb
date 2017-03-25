class Train < ApplicationRecord
  belongs_to :route, optional: true
  belongs_to :current_station, class_name: 'RailwayStation',
                              foreign_key: :railway_station_id # для fk в бд
  has_many :tickets
end
