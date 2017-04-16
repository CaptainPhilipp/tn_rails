class ApplicationController < ActionController::Base
  include ApplicationHelper
  include FormLayoutHelper
  protect_from_forgery with: :exception
  before_action :set_locale

  def after_sign_in_path_for(_resource)
    current_user.admin? ? admin_path : new_search_path
  end

  private

  def default_url_options
    { locale: I18n.locale }
  end

  def set_locale
    I18n.locale = params[:locale] || extract_locale_from_header || I18n.default_locale
  end

  def extract_locale_from_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).try(:first)
  end
end
