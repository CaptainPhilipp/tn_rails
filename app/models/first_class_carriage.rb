class FirstClassCarriage < Carriage
  include CollectionFields
  collection_sum_fields :bottom_places
end
