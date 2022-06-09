class Achievement < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :badge, optional: true

  scope :with_badge, -> { where.not(badge_id: nil).order(:user_id) }
  scope :user_achieve, ->(user_id) { where(user_id: user_id) }
  scope :user_achieve_badge, ->(user_id) { where(user_id: user_id).with_badge }
end
