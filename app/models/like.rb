class Like < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :shout

  # validations
  validates :user_id, uniqueness: { scope: :shout_id }
end
