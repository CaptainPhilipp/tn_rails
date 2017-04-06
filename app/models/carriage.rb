class Carriage < ApplicationRecord
  belongs_to :train, optional: true

  validates :serial, uniqueness: { scope: :train_id }
  validates :type, presence: true
  before_validation :set_serial

  CarType = Struct.new(:type, :ru)
  TYPES   = [CarType.new('EconomyCarriage', 'Плацкарт'),
             CarType.new('CoupeCarriage', 'Купе'),
             CarType.new('FirstClassCarriage', 'СВ'),
             CarType.new('SeatCarriage', 'Сидячий')].freeze

  scope :free, -> { where(train_id: nil) }

  private

  def set_serial
    return unless train
    self.serial ||= train.carriages.maximum(:serial) + 1
  end
end
