class EconomyCarriage < Carriage
  extend CollectionFields
  collection_sum_fields :bottom_places, :top_places, :side_bottom_places, :side_top_places
end
