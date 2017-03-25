class Train < ApplicationRecord
  belongs_to :route
  belongs_to :current_station, class_name: 'RailwayStation',
                              foreign_key: :railway_station_id
end
