class Carriage < ApplicationRecord
  belongs_to :train

  before_validation :set_serial

  CarType = Struct.new(:type, :ru_title)

  TYPES = [CarType.new('EconomyCarriage', 'Плацкарт'),
           CarType.new('CoupeCarriage', 'Купе'),
           CarType.new('FirstClassCarriage', 'СВ'),
           CarType.new('SeatCarriage', 'Сидячий')].freeze

  PLACE_FIELDS = [:top_places, :bottom_places,
                 :side_top_places, :side_bottom_places,
                 :seat_places].freeze

  def set_serial
    serials = Carriage.select(:serial).where(train_id: train_id)
    self.serial ||= serials.maximum(:serial) + 1
  end

  def self.place_fields
    PLACE_FIELDS.select { |place_field| self.respond_to? place_field }
  end
  #
  # вообще, более очевидно вышло бы с динамическим объявлением классовых методов
  # и явным указанием полей для конкретного наследника.
  # но оставлю это на рефакторинг.
  #

  # массив строк характеристик
  # некрасивый формат в рассчете на локализацию. - все равно символы будут.
  def place_counts_string
    self.class.place_fields.map { |place_field| "#{place_field}: #{send place_field}" }
  end

  def places_total
    PLACE_FIELDS.inject(0) { |memo, place_field| memo + send(place_field) }
  end
end
