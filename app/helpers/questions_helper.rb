module QuestionsHelper
  def question_header(test)
    header = " #{test.title.capitalize} Question"
    header.insert(0,"Create New")  if params[:action] == 'new'
    header.insert(0,"Edit") if params[:action] == 'edit' 
    header
  end

  def date_year
    year = Date.current.year
  end

  def github_url(author, repo)
    link_to "#{author}, #{repo}", 'https://github.com/DenisTDA/TestGuru', rel: 'nofollow' 'noopener', target: '_blank'
  end
end
