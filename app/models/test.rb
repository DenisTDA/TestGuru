class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results
  has_many :achievements

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_id, ->(id) { where(id: id) }
  scope :by_level, ->(level) { where(level: level) }
  scope :by_category_level, ->(category_id, level) { where(category_id: category_id).by_level(level) }
  scope :by_category_title, lambda { |category_title|
                              joins(:category)
                                .where(categories: { title: category_title })
                                .order(title: :desc)
                            }

  def self.list_by_category_title(category_title)
    by_category_title(category_title).pluck(:title)
  end

  def self.ids_by_category(category_id)
    where(category_id: category_id).distinct.pluck(:id)
  end

  def self.ids_by_category_level_uniq(category_id, level)
    by_category_level(category_id, level).distinct.pluck(:id)
  end

  def self.ids_by_category_level(category_id, level)
    by_category_level(category_id, level).pluck(:id)
  end

  def category_id
    category&.id
  end
end
