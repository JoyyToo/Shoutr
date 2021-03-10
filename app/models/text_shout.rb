class TextShout < ApplicationRecord
  # validations
  validates :body, presence: true, length: { in: 1...144 }
end
