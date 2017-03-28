class Train < ApplicationRecord
  belongs_to :route, optional: true
  belongs_to :current_station, class_name: 'RailwayStation'
  has_many :tickets
  has_many :carriages
end
