class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :collection_posts
  # has_many :collections, through: :collection_posts
  belongs_to :collection, optional: true # Optional if you want to allow uncategorized bookmarks

  validates :user_id, uniqueness: { scope: :post_id }
end
