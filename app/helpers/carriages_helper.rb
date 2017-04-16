module CarriagesHelper
  def carriage_options_for_select
    Carriage::TYPES.map { |type| [t(type, scope: 'activerecord.models'), type] }
  end
end
