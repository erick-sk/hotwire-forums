class Discussion < ApplicationRecord
  belongs_to :user, default: -> { Current.user }

  # Validates
  validates :name, presence: true
end
