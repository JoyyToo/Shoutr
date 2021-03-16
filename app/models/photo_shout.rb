# frozen_string_literal: true

class PhotoShout < ApplicationRecord
  has_one_attached :image
  has_attached_file :image, styles: { thumb: '200 * 200' }

  # validation
  validates_attachment :image,
                       content_type: { content_type: %w[image/jpeg image/gif image/png] },
                       size: { in: 0..10.megabytes },
                       presence: true
end
