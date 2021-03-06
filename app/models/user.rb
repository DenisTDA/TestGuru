class User < ApplicationRecord
  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :validatable,
          :trackable,
          :confirmable

  EMAIL_FORMAT = URI::MailTo::EMAIL_REGEXP

  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :examinations, class_name: 'Test', foreign_key: :author_id
  has_many :gists, dependent: :destroy
  has_many :achievements, dependent: :destroy
  has_many :badges, through: :achievements

  validates :email, presence: true
  validates :email, format: EMAIL_FORMAT

  def test_passage(test)
    results.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end
end
