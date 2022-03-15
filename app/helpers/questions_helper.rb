module QuestionsHelper
  def question_header(test)
    header = " #{test.title.capitalize} Question"
    header.insert(0, 'Create New') if test.new_record?
    header.insert(0, 'Edit') if test.persisted?
    header
  end

  def date_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to "#{author}, #{repo}", 'https://github.com/DenisTDA/TestGuru', rel: 'nofollow' 'noopener', target: '_blank'
  end
end
