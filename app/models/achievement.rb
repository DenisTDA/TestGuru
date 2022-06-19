class Achievement < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :badge, optional: true

  scope :by_user, ->(user_id) { where(user_id: user_id) }
end
