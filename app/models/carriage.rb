class Carriage < ApplicationRecord
  belongs_to :train

  scope :coupe,   -> { where carriage_type: 'coupe' }
  scope :economy, -> { where carriage_type: 'economy' }
  scope :bottom_seats, -> { sum(:top_seats) }
  scope :top_seats,    -> { sum(:bottom_seats) }

  TYPES = %w(economy coupe)
end
