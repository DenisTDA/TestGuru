module QuestionsHelper
  def question_header(test, question)
    header = " #{test.title.capitalize} #{t('helpers.questions_helper.question')}"
    if question.new_record?
      header.insert(0,
                    t('helpers.questions_helper.create'))
    else
      header.insert(0,
                    t('helpers.questions_helper.edit'))
    end
    header
  end
end
