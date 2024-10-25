class Collection < ApplicationRecord
  belongs_to :user
  has_many :collection_posts
  has_many :bookmarks, through: :collection_posts
end
