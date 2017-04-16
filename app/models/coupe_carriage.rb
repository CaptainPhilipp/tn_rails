class CoupeCarriage < Carriage
  include CollectionFields
  collection_sum_fields :bottom_places, :top_places
end
