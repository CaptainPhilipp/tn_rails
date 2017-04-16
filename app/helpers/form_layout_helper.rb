module FormLayoutHelper
  # def collection_select_options(options)
  def collection_select_options(key = nil, collection: nil, value_method: nil,
                                text_method: nil, options: {}, html_options: {})
    key          ||= "#{o[:key]}_id"
    value_method ||= :id
    text_method  ||= method_key(collection.first, :title, :number, :name)
    html_options   = { class: 'form-control' }.merge(html_options)

    [key, collection, value_method, text_method, options, html_options]
  end

  private

  def method_key(sample_object, *method_keys)
    method_keys.each do |method_key|
      return method_key if sample_object.respond_to? method_key
    end
    raise 'ERROR: Right :text_method is not defined'
  end
end
