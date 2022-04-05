class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale

  def after_sign_in_path_for(_resource)
    current_user.admin? ? admin_tests_path : root_path
  end

  def default_url_options
    return {} if I18n.locale == I18n.default_locale

    { lang: I18n.locale }
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
