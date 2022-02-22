class User < ApplicationRecord

  def tests_level(level)
    Result.joins('JOIN tests ON tests.id = results.test_id').where('tests.level = :level AND results.user_id = :id' , level: level, id: self.id)
  end
end
