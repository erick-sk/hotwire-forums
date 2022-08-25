class Post < ApplicationRecord
  # Validates
  validates :body, presence: true

  # Associations
  belongs_to :discussion
  belongs_to :user, default: -> { Current.user }

  # Action text
  has_rich_text :body
end
