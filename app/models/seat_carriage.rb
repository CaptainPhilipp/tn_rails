class SeatCarriage < Carriage
  class << self
    def seats
      sum(:bottom_places)
    end
  end
end
