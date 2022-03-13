module QuestionsHelper
  def question_header
    header = " #{@test.title.capitalize} Question"
    header.insert(0,"Create New")  if params[:action] == 'new'
    header.insert(0,"Edit") if params[:action] == 'edit' 
    header
  end

  def date_year
    Date::DATE_FORMATS[:year] = '%Y'
    Date.current.to_formatted_s(:year) 
  end

  def github_url(author, repo)
    (link_to "#{author}, #{repo}", 'https://github.com/DenisTDA/TestGuru', rel: 'nofollow' 'noopener', target: '_blank' )
  end
end
