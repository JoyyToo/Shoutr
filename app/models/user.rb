class User < ApplicationRecord
  include Clearance::User
  # validations
  validates :username, presence: true, uniqueness: true

  # associations
  has_many :shouts, dependent: :destroy
end
