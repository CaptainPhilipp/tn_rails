class Carriage < ApplicationRecord
  belongs_to :train

  scope :coupe,   -> { where carriage_type: 'CoupeCarriage' }
  scope :economy, -> { where carriage_type: 'EconomyCarriage' }

  CarType = Struct.new(:type, :ru_title)

  # структы для вызова элементов хелперами форм, как методы
  TYPES = [CarType.new('economy', 'Плацкарт'),
           CarType.new('coupe', 'Купе'),
           CarType.new('first_class', 'СВ'),
           CarType.new('seat', 'Сидячий')].freeze

  TYPES_LIST = TYPES.map { |car_type| "#{car_type.type.classify}Carriage" }.freeze

  def places_total
    top_places + bottom_places + side_top_places + side_bottom_places
  end
end
