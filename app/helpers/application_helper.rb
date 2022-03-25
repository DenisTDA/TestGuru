module ApplicationHelper
  def show_flash(flash)
    form_flash = ''
    flash.each do |type, msg|
      form_flash = "<div class = 'flash'><div class = 'flash #{type.to_str}'>#{msg}<\/div><\/div>" if flash[type]
    end

    form_flash.html_safe
  end
end
