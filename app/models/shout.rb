class Shout < ApplicationRecord
  # validations
  validates :body, presence: true, length: { in: 1...144 }
  validates :user, presence: true

  # associations
  belongs_to :user

  # scopes
  scope :descending, -> { order(created_at: :desc) }

  delegate :username, to: :user
end
