class Carriage < ApplicationRecord
  belongs_to :train

  validates :serial, uniqueness: { scope: :train_id }
  before_validation :set_serial

  TYPES = {type: 'EconomyCarriage',    ru_title: 'Плацкарт'),
           type: 'CoupeCarriage',      ru_title: 'Купе'),
           type: 'FirstClassCarriage', ru_title: 'СВ'),
           type: 'SeatCarriage',       ru_title: 'Сидячий')}.freeze

  PLACE_FIELDS = [:top_places, :bottom_places,
                 :side_top_places, :side_bottom_places,
                 :seat_places].freeze

  def set_serial
    max = Carriage.select(:serial).where(train_id: train_id).maximum(:serial)
    self.serial ||= max + 1
  end

  def self.place_fields
    PLACE_FIELDS.select { |place_field| self.respond_to? place_field }
  end

  # массив строк характеристик
  def place_counts_string
    self.class.place_fields.map { |place_field| "#{place_field}: #{send place_field}" }
  end

  def places_total
    PLACE_FIELDS.inject(0) { |memo, place_field| memo + send(place_field) }
  end
end
