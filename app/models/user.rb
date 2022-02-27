class User < ApplicationRecord
  def tests_by_level(level)
    Test.joins('JOIN results ON tests.id = results.test_id')
        .where({ level: level }).where({ results: { user_id: id } })
  end
end
