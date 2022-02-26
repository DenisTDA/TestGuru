class User < ApplicationRecord
  
  def tests_by_level(level)
    Test.joins('JOIN results ON tests.id = results.test_id')
          .where({level: level} && {results: {user_id: self.id}})
  end
end
