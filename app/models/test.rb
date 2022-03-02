class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, :class_name => 'User'

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results
  
  def self.list_tests(category_title)
    joins(:categories )
      .where(categories: { title: category_title })
      .order(title: :desc)
      .pluck(:title)
  end
end
