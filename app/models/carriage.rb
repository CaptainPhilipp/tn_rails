class Carriage < ApplicationRecord
  belongs_to :train

  TYPES = %w(economy coupe)
end
