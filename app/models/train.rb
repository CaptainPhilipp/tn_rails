class Train < ApplicationRecord
  belongs_to :route, optional: true
  belongs_to :current_station, class_name: 'RailwayStation'
  has_many :tickets

  has_many :carriages
  has_many :coupe_carriages
  has_many :economy_carriages
  has_many :fist_class_carriages
  has_many :seat_carriages

  alias old_carriages carriages

  scope :carriages, -> { old_carriages.order(serial: reverse_cars_sort ? :desc : :asc) }

  def places_total
    carriages.inject(0) { |memo, car| memo + car.places_total }
  end
end
