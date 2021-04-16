class Shout < ApplicationRecord
  # validations
  validates :user, presence: true

  # associations
  belongs_to :user
  belongs_to :content, polymorphic: true

  delegate :username, to: :user
end
