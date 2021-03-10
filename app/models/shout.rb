class Shout < ApplicationRecord
  # validations
  validates :body, presence: true, length: { in: 1...144 }
  validates :user, presence: true

  # associations
  belongs_to :user
end
