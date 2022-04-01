module ApplicationHelper
  def show_flash(type)
    return unless flash[type]

    content_tag(:p, content_tag(:p, flash[type], class: "flash #{type}"), class: 'flash').html_safe
  end
end
