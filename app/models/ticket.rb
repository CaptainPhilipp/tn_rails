class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :train
  belongs_to :departure, class_name: 'RailwayStation'
  belongs_to :arrival,   class_name: 'RailwayStation'
end
