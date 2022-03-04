class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_range, on: [ :create, :update ]

  scope :correct, -> { where(correct: true) }
 
  private
  def validate_range
    if question.answers.count >= 4 
      errors.add(:base, "Have to contain 1 - 4 answers") 
    end
  end
end
