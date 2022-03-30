module ApplicationHelper
  def show_flash(type)
    return unless flash[type]

    form_flash = content_tag(:p, content_tag(:p, flash[type], class: "flash #{type}"), class: 'flash')
    form_flash.html_safe
  end
end
