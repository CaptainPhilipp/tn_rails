class Carriage < ApplicationRecord
  belongs_to :train

  CarType = Struct.new(:type, :ru_title)

  # структы для вызова элементов хелперами форм, как методы
  TYPES = [CarType.new('EconomyCarriage', 'Плацкарт'),
           CarType.new('CoupeCarriage',   'Купе'),
           CarType.new('FirstClassCarriage', 'СВ'),
           CarType.new('SeatCarriage',    'Сидячий')].freeze

  PLACE_TYPES = [:top_places, :bottom_places, :side_top_places, :side_bottom_places]

  def places_total
    top_places + bottom_places + side_top_places + side_bottom_places + seat_places
  end
end
