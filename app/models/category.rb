class Category < ApplicationRecord
  # Validates
  validates :name, presence: true

  # Associations
  has_many :discussions, dependent: :nullify

  # scopes
  scope :sorted, -> { order(name: :asc) }

  # turbo_stream
  after_create_commit -> { broadcast_prepend_to "categories" }
  after_update_commit -> { broadcast_replace_to "categories" }
  after_destroy_commit -> { broadcast_remove_to "categories" }

  # friendly url
  def to_param
    "#{id}-#{name.downcase.to_s[0...100]}".parameterize
  end
end
