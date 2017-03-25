class RailwayStation < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2, maximum: 20 }
end
