class Carriage < ApplicationRecord
  belongs_to :train

  CarType = Struct.new(:type, :ru_title)

  # для вызова элементов хелперами форм
  TYPES = [CarType.new('EconomyCarriage', 'Плацкарт'),
           CarType.new('CoupeCarriage', 'Купе'),
           CarType.new('FirstClassCarriage', 'СВ'),
           CarType.new('SeatCarriage', 'Сидячий')].freeze

  # list of places fields
  PLACE_FIELDS = [:top_places, :bottom_places,
                 :side_top_places, :side_bottom_places,
                 :seat_places].freeze

  # list of place fields class methods
  # (that must return sum's of fields in collection
  # for current Carriage type)
  def self.place_fields
    PLACE_FIELDS.select { |place_field| self.class.respond_to? place_field }
  end
  #   
  # вообще, более очевидно вышло бы с динамическим объявлением классовых методов
  # и явным указанием полей для конкретного наследника.
  # но оставлю это на рефакторинг.
  #   

  # массив строк характеристик
  # некрасивый формат в рассчете на локализацию. - все равно символы будут.
  def place_counts_string
    self.class.place_fields.map { |place_type| "#{place_type}: #{send place_type}" }
  end

  def places_total
    PLACE_FIELDS.inject(0) { |memo, place_field| memo + send(place_field) }
  end
end
