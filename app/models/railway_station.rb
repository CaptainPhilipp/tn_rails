class RailwayStation < ApplicationRecord
  has_and_belongs_to_many :routes
  has_many :trains

  validates :title, presence: true, length: { minimum: 2, maximum: 20 }
end
