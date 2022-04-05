class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_level, ->(level) { where(level: level) }
  scope :by_category_title, lambda { |category_title|
                              joins(:category)
                                .where(categories: { title: category_title })
                                .order(title: :desc)
                            }

  def self.list_by_category_title(category_title)
    by_category_title(category_title).pluck(:title)
  end
end
