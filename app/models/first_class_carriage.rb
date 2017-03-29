class FirstClassCarriage < Carriage
  class << self
    def bottom_places
      sum(:bottom_places)
    end
  end
end
