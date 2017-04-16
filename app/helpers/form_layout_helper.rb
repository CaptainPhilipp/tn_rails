module FormLayoutHelper
  def method_key_if_respond(sample_object, *method_keys)
    method_keys.each do |method_key|
      return method_key if sample_object.respond_to? method_key
    end
  end
end
