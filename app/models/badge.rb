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
  scope :rules_list, -> { joins(:rule).pluck('rules.name') }
  scope :pictures_list, -> { order(:picture).distinct.pluck(:picture) }

  def self.get_imgs
    pictures = Dir[PATH_IMAGES]
    pictures.map! { |path| path.split('/').pop }
  end

  def self.get_imgs_free
    get_imgs.difference(Badge.pluck(:picture))
  end

  def rule_name
    rule.name
  end

  private

  def set_category_id(data)
    data[:result].test_category_id
  end
end
