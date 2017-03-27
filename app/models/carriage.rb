class Carriage < ApplicationRecord
  belongs_to :train

  scope :coupe,   -> { where carriage_type: 'coupe' }
  scope :economy, -> { where carriage_type: 'economy' }
  scope :seats_count, ->(position) { sum("#{position}_seats") }

  TYPES = %w(economy coupe)
end
