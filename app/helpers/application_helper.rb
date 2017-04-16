module ApplicationHelper
  def i18n_submit(instance, custom_action_name = nil)
    model_name = I18n.t(instance.model_name.singular, scope: 'activerecord.models', count: 1)
    action_name = instance.new_record? ? t(:create) : t(:update)
    "#{custom_action_name || action_name} #{model_name.downcase}"
  end

  def glyphicon(name)
    raw "<span class='glyphicon glyphicon-#{name}' aria-hidden='true'></span>"
  end
end
