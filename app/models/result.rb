class Result < ApplicationRecord
  SUCCESS_RATIO = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question, on: %i[create update]

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.success = true if successful?
    current_question = nil if time_out?

    save!
  end

  def complited?
    current_question.nil?
  end

  def number_question
    test.questions.index(current_question) + 1
  end

  def successful?
    percentage_result > SUCCESS_RATIO
  end

  def percentage_result
    (self.correct_questions * 100 / test.questions.count.to_f).round(2)
  end

  def test_category_id
    test.category_id
  end

  def test_level
    test.level
  end

  def list_tests_success
    user.tests.where(results: { success: true })
  end

  def time_limit
    test.time_limit
  end

  def time_left
    (created_at - Time.current).round + test.time_limit
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

  def time_out?
    created_at + test.time_limit < Time.current
  end

  def next_question
    if current_question.nil?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end
end
