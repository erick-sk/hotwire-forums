class Discussion < ApplicationRecord
  belongs_to :user, default: -> { Current.user }

  # Validates
  validates :name, presence: true

  # friendly url
  def to_param
    "#{id}-#{name.downcase.to_s[0...100]}".parameterize
  end
end
