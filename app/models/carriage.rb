class Carriage < ApplicationRecord
  belongs_to :train

  validates :serial, uniqueness: { scope: :train_id }
  validates :type, presence: true # исключая родительский класс
  before_validation :set_serial

  CarType = Struct.new(:type, :ru)
  TYPES   = [CarType.new('EconomyCarriage', 'Плацкарт'),
             CarType.new('CoupeCarriage', 'Купе'),
             CarType.new('FirstClassCarriage', 'СВ'),
             CarType.new('SeatCarriage', 'Сидячий')].freeze

  private

  def set_serial
    self.serial ||= train.carriages.maximum(:serial) + 1
  end
end
