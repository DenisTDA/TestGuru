class User < ApplicationRecord
  EMAIL_FORMAT = URI::MailTo::EMAIL_REGEXP

  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :examinations, class_name: 'Test', foreign_key: :author_id

  validates :email, presence: true
  validates :email, format: EMAIL_FORMAT

  has_secure_password

  def test_passage(test)
    results.order(id: :desc).find_by(test_id: test.id)
  end
end
