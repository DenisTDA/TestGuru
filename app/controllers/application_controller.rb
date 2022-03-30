class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(_resource)
    current_user.admin? ? admin_tests_path : root_path
  end
end
