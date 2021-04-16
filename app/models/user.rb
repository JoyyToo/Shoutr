class User < ApplicationRecord
  include Clearance::User
  # validations
  validates :username, presence: true, uniqueness: true

  # associations
  has_many :shouts, dependent: :destroy
  has_many :likes
  has_many :liked_shouts, through: :likes, source: :shout

  has_many :following_relationships, foreign_key: :follower_id
  has_many :followed_users, through: :following_relationships

  has_many :follower_relationships, foreign_key: :followed_user_id, class_name: 'FollowingRelationship'
  has_many :followers, through: :follower_relationships

  def like(shout)
    liked_shouts << shout
  end

  def unlike(shout)
    liked_shouts.destroy(shout)
  end

  def liked?(shout)
    liked_shout_ids.include? shout.id
  end

  def follow(user)
    followed_users << user
  end

  def unfollow(user)
    followed_users.destroy(user)
  end

  def following?(user)
    followed_user_ids.include? user.id
  end

  def to_param
    username
  end
end
