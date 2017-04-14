class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception

  def after_sign_in_path_for(_resource)
    current_user.admin? ? admin_path : new_search_path
  end
end
