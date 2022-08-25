class Discussion < ApplicationRecord
  belongs_to :user, default: -> { Current.user }

  # Validates
  validates :name, presence: true

  # turbo_stream
  after_create_commit -> { broadcast_prepend_to "discussions"}
  after_update_commit -> { broadcast_replace_to "discussions"}
  after_destroy_commit -> { broadcast_remove_to "discussions"}

  # friendly url
  def to_param
    "#{id}-#{name.downcase.to_s[0...100]}".parameterize
  end
end
