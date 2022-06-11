class Achievement < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :badge, optional: true

  scope :with_badge, -> { where.not(badge_id: nil).order(:user_id) }
  scope :user_achieve, ->(user_id) { where(user_id: user_id) }
  scope :user_achieve_badge, ->(user_id) { where(user_id: user_id).with_badge }
  scope :first_test, ->(test_id, user_id) { where(test_id: test_id, user_id: user_id) }
  scope :by_user, ->(user_id) { where(user_id: user_id) }
  scope :by_test, ->(test_id) { where(test_id: test_id) }
  scope :by_test_user, ->(test_id, user_id) { where(test_id: test_id, user_id: user_id) }
end
