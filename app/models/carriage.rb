class Carriage < ApplicationRecord
  belongs_to :train

  CarType = Struct.new(:type, :ru_title)

  # структы для вызова элементов хелперами форм, как методы
  TYPES = [CarType.new('EconomyCarriage', 'Плацкарт'),
           CarType.new('CoupeCarriage',   'Купе'),
           CarType.new('FirstClassCarriage', 'СВ'),
           CarType.new('SeatCarriage',    'Сидячий')].freeze

  PLACE_TYPES = [:top_places, :bottom_places,
                 :side_top_places, :side_bottom_places,
                 :seat_places].freeze

  def self.place_types
    PLACE_TYPES.select { |type_method| self.respond_to? type_method }
  end

  def place_types
    self.class.place_types
  end

  def places_total
    PLACE_TYPES.inject(0) { |memo, type_method| memo + send(type_method) }
  end
end
