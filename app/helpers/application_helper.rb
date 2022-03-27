module ApplicationHelper
  def show_flash(type)
    return unless flash[type]

    form_flash = "<div class = 'flash'><div class = 'flash #{type}'>#{flash[type]}<\/div><\/div>"
    form_flash.html_safe
  end
end
