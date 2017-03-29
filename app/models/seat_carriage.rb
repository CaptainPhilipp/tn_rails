class SeatCarriage < Carriage
  class << self
    def seat_places
      sum(:seat_places)
    end
  end
end
