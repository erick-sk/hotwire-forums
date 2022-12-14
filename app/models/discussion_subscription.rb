class DiscussionSubscription < ApplicationRecord
  # Validations
  validates :subscription_type, presence: true, inclusion: { in: %w[optin optout] }
  validates :user_id, uniqueness: { scope: :discussion_id }

  # Associations
  belongs_to :discussion
  belongs_to :user

  # scope
  scope :optin, -> { where(subscription_type: :optin) }
  scope :optout, -> { where(subscription_type: :optout) }

  def toggle!
    case subscription_type
    when "optin"
      update(subscription_type: "optout")
    when "optout"
      update(subscription_type: "optin")
    end
  end
end
