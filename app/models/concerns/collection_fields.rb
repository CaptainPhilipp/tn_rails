module CollectionFields
  def collection_sum_fields(*fields)
    fields.each { |field| define_singleton_method(field) { sum(field) } }

    define_singleton_method(:place_fields) { fields }
    define_singleton_method(:places_total) { sum("#{fields * '+'}") }

    define_method(:place_fields) { fields }
    define_method(:places_total) { fields.inject(0) { |m, f| m + send(f) } }
    define_method(:place_counts_string) do
      fields.map { |field| "#{field}: #{send field}" }
    end
  end
end
