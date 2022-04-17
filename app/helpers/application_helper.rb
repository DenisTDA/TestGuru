module ApplicationHelper
  def show_flash(type)
    return unless flash[type]

    content_tag(:div, flash[type].html_safe, class: "alert alert-#{get_type_flash(type)}")
  end

  def get_type_flash(type)
    { alert: 'warning', notice: 'info' }[type] || type.to_s
  end

  def date_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to "#{author}, #{repo}", 'https://github.com/DenisTDA/TestGuru', rel: 'nofollow noopener', target: '_blank'
  end
end
