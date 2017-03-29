class EconomyCarriage < Carriage
  class << self
    def bottom_places
      sum(:bottom_places)
    end

    def top_places
      sum(:top_places)
    end

    def side_bottom_places
      sum(:side_bottom_places)
    end

    def side_top_places
      sum(:side_top_places)
    end
  end
end
