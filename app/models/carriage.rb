class Carriage < ApplicationRecord
  belongs_to :train, optional: true

  validates :serial, uniqueness: { scope: :train_id }
  validates :type, presence: true
  validates_with CarriageValidateType

  before_validation :set_serial

  TYPES = %w(EconomyCarriage
             CoupeCarriage
             FirstClassCarriage
             SeatCarriage).freeze

  scope :free, -> { where(train_id: nil) }

  private

  def set_serial
    return unless train
    self.serial ||= (train.carriages.maximum(:serial) || 0) + 1
  end
end
