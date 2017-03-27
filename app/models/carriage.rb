class Carriage < ApplicationRecord
  belongs_to :train

  scope :coupe,   -> { where carriage_type: 'coupe' }
  scope :economy, -> { where carriage_type: 'economy' }

  TYPES = %w(economy coupe)  
end
