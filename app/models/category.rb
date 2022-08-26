class Category < ApplicationRecord
  # Validates
  validates :name, presence: true

  # Associations
  has_many :discussions, dependent: :nullify

  # scopes
  scope :sorted, -> { order(name: :asc) }
end
