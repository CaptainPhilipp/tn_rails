module FormLayoutHelper
  def render_collection_select(*args)
    keys = %i(form key collection method value_method text_method options http_options)
    render layout_path(:collection_select), collection_select_options(args, keys)
  end

  def render_texf_field(form, key)
    render layout_path(:text_field), form: form, key: key
  end

  def render_submit(form, object, translate_path = nil)
    render layout_path(:submit), form: form, object: object, value: i18n_submit(object, translate_path)
  end

  def render_labled_form_group(form, key, &block)
    render layout_path(:labled_form_group), form: form, key: key, &block
  end

  def render_base_div(&block)
    render layout_path(:base_div), &block
  end

  private

  def layout_path(layout)
    "layouts/form/#{layout}"
  end

  def i18n_submit(instance, translate_path = nil)
    model_name = I18n.t(instance.model_name.singular, scope: 'activerecord.models', count: 1)
    translate_path ||= instance.new_record? ? :create : :update
    "#{t(translate_path)} #{model_name.downcase}"
  end

  def collection_select_options(args, keys)
    raise ArgumentError if args.size > keys.size
    options = product_hash(args, keys)
    options.merge(generate_default_options(options))
  end

  def product_hash(args, keys)
    keys = keys[0..(args.size - 1)] if args.size < keys.size
    args.map { |a| a.to_s[1] == '_' ? nil : a }
    [keys, args].transpose.to_h
  end

  def generate_default_options(options)
    key = options[:key].to_s
    {
      method: key[-1] == 's' ? "#{key[0..-2]}_ids" : "#{key}_id",
      value_method: :id,
      text_method: method_key(options[:collection], :title, :number, :name),
      options: {},
      html_options: { class: 'form-control' }.merge(options[:html_options] || {})
    }
  end

  def method_key(collection, *method_keys)
    sample_object = collection.first
    method_keys.each do |method_key|
      return method_key if sample_object.respond_to? method_key
    end
    raise 'ERROR: Right :text_method is not defined'
  end
end
