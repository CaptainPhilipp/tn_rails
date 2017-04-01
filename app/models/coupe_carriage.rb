class CoupeCarriage < Carriage
  extend CollectionFields
  collection_sum_fields :bottom_places, :top_places
end
