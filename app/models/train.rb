class Train < ApplicationRecord
  belongs_to :route, optional: true
  belongs_to :current_station, class_name: 'RailwayStation'
  has_many :tickets

  has_many :carriages, dependent: :nullify
  has_many :coupe_carriages
  has_many :economy_carriages
  has_many :fist_class_carriages
  has_many :seat_carriages

  alias old_carriages carriages

  def carriages
    old_carriages.order(serial: reverse_cars_sort ? :desc : :asc)
  end

  def places_total
    carriages.inject(0) { |memo, car| memo + car.places_total }
  end

  def available_carriages
    Carriage.where('id IN (?) OR train_id IS NULL', carriage_ids)
  end

  def get_carriages(car_type, place_type)
    carriages.where(type: car_type).sum(place_type)
  end
end
