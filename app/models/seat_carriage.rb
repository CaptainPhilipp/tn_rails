class SeatCarriage < Carriage
  include CollectionFields
  collection_sum_fields :seat_places
end
