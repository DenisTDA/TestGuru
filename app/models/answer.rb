class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_range, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_range
    errors.add(:base, 'Must be only 1 - 4 answers') if question.answers.count >= 4
  end
end
