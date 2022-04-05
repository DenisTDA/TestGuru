class Category < ApplicationRecord
  default_scope { order(title: :asc) }

  has_many :tests, dependent: :destroy

  validates :title, presence: true

  def translate_title
    I18n.t(title, scope: 'category')
  end
end
