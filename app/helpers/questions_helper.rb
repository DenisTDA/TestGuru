module QuestionsHelper
  def question_header(test, question)
    header = " #{test.title.capitalize} Question"
    question.new_record? ? header.insert(0, 'Create New') : header.insert(0, 'Edit')
    header
  end

  def date_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to "#{author}, #{repo}", 'https://github.com/DenisTDA/TestGuru', rel: 'nofollow' 'noopener', target: '_blank'
  end
end
