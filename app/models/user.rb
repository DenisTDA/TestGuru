class User < ApplicationRecord
  def tests_by_level(level)
    Test.joins('JOIN results ON tests.id = results.test_id')
            .where('tests.level = :level AND results.user_id = :id' , level: level, id: self.id)
  end
end
