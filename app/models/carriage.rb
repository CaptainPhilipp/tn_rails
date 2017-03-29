class Carriage < ApplicationRecord
  belongs_to :train

  scope :coupe,   -> { where carriage_type: 'CoupeCarriage' }
  scope :economy, -> { where carriage_type: 'EconomyCarriage' }

  CarType = Struct.new(:type, :ru_title)

  # структы для вызова элементов хелперами форм, как методы
  TYPES = [CarType.new('EconomyCarriage', 'Плацкарт'),
           CarType.new('CoupeCarriage',   'Купе'),
           CarType.new('FirstClassCarriage', 'СВ'),
           CarType.new('SeatCarriage',    'Сидячий')].freeze

  def places_total
    top_places + bottom_places + side_top_places + side_bottom_places
  end
end
