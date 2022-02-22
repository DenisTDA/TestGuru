class Test < ApplicationRecord

  class << self
    def list_tests(category_title)
      self.joins('JOIN categories ON tests.category_id=categories.id').where('categories.title = :title', title: category_title).order('tests.id DESC')
    end
  end
end
