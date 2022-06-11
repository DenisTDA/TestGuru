class Badge < ApplicationRecord
  has_many :achievements, dependent: :destroy
  has_many :users, through: :achievements

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :picture, presence: true
  validates :rule, presence: true
  validates :rule, uniqueness: true

  scope :find_by_rule, ->(rule) { where(rule: rule) }
end
