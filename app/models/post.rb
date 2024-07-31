class Post < ApplicationRecord
  validates :place_name, presence: true, length: { maximum: 255 }
  validates :adress, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65_535 }

  belongs_to :user
  mount_uploader :post_image, PostImageUploader
end
