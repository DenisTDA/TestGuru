class Badge < ApplicationRecord
  PATH_IMAGES = './app/assets/images/*.png'.freeze

  has_many :achievements, dependent: :destroy
  has_many :users, through: :achievements
  belongs_to :rule

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :picture, presence: true
  validates :rule_id, uniqueness: true

  scope :names_list, -> { order(:name).distinct.pluck(:name) }
  scope :rules_list, -> { order(:rule).distinct.pluck(:rule) }
  scope :pictures_list, -> { order(:picture).distinct.pluck(:picture) }

  def self.get_imgs
    pictures = Dir[PATH_IMAGES]
    pictures.map! { |path| path.split('/').pop }
  end

  def self.get_imgs_free
    get_imgs.difference(Badge.pluck(:picture))
  end

  def deserved?(data)
    send(rule.name.to_sym, data)
  end

  private

  def set_category_id(data)
    data[:result].test.category.id
  end

  def first_test(data)
    return if data[:tests_success].empty?

    data[:tests_success].pluck(:id).include?(data[:result][:test_id]) unless data[:tests_success].empty?
  end

  def tests_10_by_category(data)
    return if data[:tests_success].empty?

    category_id = set_category_id(data)
    tests_category = data[:tests_success].where(category_id: category_id)
                                         .pluck(:test_id)
                                         .uniq
    tests_category.count == 10
  end

  def category_level(data)
    return if data[:tests_success].empty?

    category_id = set_category_id(data)
    level = data[:result].test.level
    tests_category_level = Test.where(category_id: category_id, level: level)

    achieves_category_level = data[:tests_success].where(category_id: category_id, level: level)
                                                  .pluck(:test_id)
                                                  .uniq

    tests_category_level.count == achieves_category_level.count
  end

  def test_first_time(data)
    return if data[:tests].empty?

    attempt = data[:tests].where(id: data[:result].test_id)
    attempt.count == 1
  end

  def test_10_times(data)
    return if data[:tests_success].empty?

    tests = data[:tests_success].where(id: data[:result].test_id)
    tests.count == 10
  end
end
