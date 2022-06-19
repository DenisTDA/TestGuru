class Result < ApplicationRecord
  SUCCESS_RATIO = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question, on: %i[create update]

  scope :tests_success, -> { where(success: true) }

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.success = true if successful?

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

  def create_achievements!
    return unless successful?

    prepare_data
    badge_ids = get_badges
    save_achievements!(badge_ids)
  end

  private

  def save_achievements!(badge_ids)
    badge_ids.each { |badge_id|  save_achievement!(badge_id) } unless badge_ids.empty?
  end

  def get_badges
    badges = []
    Badge.all.each { |badge| badges << badge.id if badge.deserved?(@data) }
    badges
  end

  def save_achievement!(badge_id)
    Achievement.create!(test_id: test_id, user_id: user_id, badge_id: badge_id)
  end

  def prepare_data
    tests = user.tests
    tests_success = list_tests_success
    achieves = Achievement.by_user(user_id)
    @data = { tests: tests, tests_success: tests_success, achieves: achieves, result: self }
  end

  def list_tests_success
    tests_success = user.tests.where(results: { success: true })
  end

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
    if current_question.nil?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end
end
