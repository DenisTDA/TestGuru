class Rule < ApplicationRecord
  has_one :badge

  validates_uniqueness_of :name

  def self.get_rules_free
    left_outer_joins(:badge).where(badges: { picture: nil })
  end
end
