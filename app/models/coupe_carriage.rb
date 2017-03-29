class CoupeCarriage < Carriage
  class << self
    def bottom_places
      sum(:bottom_places)
    end

    def top_places
      sum(:top_places)
    end
  end
end
