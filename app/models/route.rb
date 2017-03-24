class RailwayStation < ApplicationRecord
  validate :title, presense: true
  
end
