class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :examinations, class_name: 'Test', foreign_key: :author_id

  has_secure_password

  def test_passage(test)
    results.order(id: :desc).find_by(test_id: test.id)
  end
end
