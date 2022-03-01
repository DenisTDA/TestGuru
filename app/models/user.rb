class User < ApplicationRecord
  has_many :results
  has_many :tests, through: :results
  has_many :tests, foreign_key: :author_id

  def tests_by_level(level)
    Test.joins('JOIN results ON tests.id = results.test_id')
        .where({ level: level }).where({ results: { user_id: id } })
  end
end
