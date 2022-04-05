module QuestionsHelper
  def question_header(test, question)
    header = " #{test.title.capitalize} Question"
    question.new_record? ? header.insert(0, 'Create New') : header.insert(0, 'Edit')
    header
  end
end
