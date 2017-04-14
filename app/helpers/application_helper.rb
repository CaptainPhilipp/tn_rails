module ApplicationHelper
  def i18n_submit(instance)
    model_name = I18n.t(instance.model_name.singular, scope: 'activerecord.models')
    action_name = instance.new_record? ? t(:create) : t(:update)
    "#{action_name} #{model_name.downcase}"
  end
end
