class Shout < ApplicationRecord
  # validations
  validates :user, presence: true

  # associations
  belongs_to :user
  belongs_to :content, polymorphic: true

  # scopes
  default_scope { order(created_at: :desc) }

  delegate :username, to: :user
end
