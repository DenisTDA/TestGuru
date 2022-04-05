module ApplicationHelper
  def show_flash(type)
    return unless flash[type]

    content_tag(:p, content_tag(:p, flash[type], class: "flash #{type}"), class: 'flash').html_safe
  end

  def date_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to "#{author}, #{repo}", 'https://github.com/DenisTDA/TestGuru', rel: 'nofollow noopener', target: '_blank'
  end
end
