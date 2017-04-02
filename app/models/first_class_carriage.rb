class FirstClassCarriage < Carriage
  extend CollectionFields
  collection_sum_fields :bottom_places
end
