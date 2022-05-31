class Feedback
  include ActiveModel::Model
  attr_accessor :body, :user

  validates :body, presence: true
end
