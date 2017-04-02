class SeatCarriage < Carriage
  extend CollectionFields
  collection_sum_fields :seat_places
end
