class Carriage < ApplicationRecord
  belongs_to :train

  validates :serial, uniqueness: { scope: :train_id }
  validates :type, presence: true # исключая родительский класс
  before_validation :set_serial

  TYPES = {type: 'EconomyCarriage',    ru_title: 'Плацкарт'),
           type: 'CoupeCarriage',      ru_title: 'Купе'),
           type: 'FirstClassCarriage', ru_title: 'СВ'),
           type: 'SeatCarriage',       ru_title: 'Сидячий')}.freeze

  PLACE_FIELDS = [:top_places, :bottom_places,
                 :side_top_places, :side_bottom_places,
                 :seat_places].freeze

  def self.place_fields
    PLACE_FIELDS.select { |place_field| self.respond_to? place_field }
  end

  # массив строк характеристик
  def place_counts_string
    self.class.place_fields.map { |place_field| "#{place_field}: #{send place_field}" }
  end

  def places_total
    self.class.sum("#{PLACE_FIELDS * ' + '}")
  end

  private

  def set_serial
    self.serial ||= train.carriages.maximum(:serial) + 1
  end

  private

  def set_serial
    max = Carriage.select(:serial).where(train_id: train_id).maximum(:serial)
    self.serial ||= max + 1
  end
end
