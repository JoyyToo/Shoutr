class User < ApplicationRecord
  include Clearance::User
  # validations
  validates :username, presence: true, uniqueness: true

  # associations
  has_many :shouts, -> { descending }, dependent: :destroy
  has_many :likes
  has_many :liked_shouts, through: :likes, source: :shout

  def like(shout)
    liked_shouts << shout
  end

  def unlike(shout)
    liked_shouts.destroy(shout)
  end

  def liked?(shout)
    liked_shout_ids.include? shout.id
  end
end
