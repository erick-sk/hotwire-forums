class Post < ApplicationRecord
  # Validates
  validates :body, presence: true

  # Associations
  belongs_to :discussion, counter_cache: true, touch: true
  belongs_to :user, default: -> { Current.user }

  # Action text
  has_rich_text :body

  # turbo_stream
  after_create_commit -> { broadcast_append_to discussion, partial: "discussions/posts/post", locals: { post: self } }
  after_update_commit -> { broadcast_replace_to discussion, partial: "discussions/posts/post", locals: { post: self } }
  after_destroy_commit -> { broadcast_remove_to discussion }
end
