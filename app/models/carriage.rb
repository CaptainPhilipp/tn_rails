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
    PLACE_TYPES.select { |place_type| self.respond_to? place_type }
  end

  def place_types
    self.class.place_types
  end

  # массив строк характеристик
  # некрасивый формат в рассчете на локализацию. - все равно символы будут.
  def place_counts_string
    place_types.map { |place_type| "#{place_type}: #{send place_type}" }
  end

  def places_total
    PLACE_TYPES.inject(0) { |memo, place_type| memo + send(place_type) }
  end
end
