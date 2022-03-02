class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :examinations, class_name: "Test", foreign_key: :author_id

  def tests_by_level(level)
    Test.where(level: level)
  end
end
