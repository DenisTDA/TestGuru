class Result < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true 

  before_validation :before_validation_set_current_question, on: %i[create update]

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def complited?
    current_question.nil?
  end

  def number_question
    test.questions.index(current_question) + 1
  end

  def successful?
    self.percentage_result > 85
  end

  def percentage_result
    (self.correct_questions * 100 / test.questions.count.to_f).round(2)
  end

  private

  def before_validation_set_current_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if self.current_question.nil?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end
end
