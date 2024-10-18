class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :name, presence: true, length: { maximum: 50 }
  validates :user_name, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :reset_password_token, uniqueness: true, allow_nil: true

  has_many :posts, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_posts, through: :bookmarks, source: :post

  mount_uploader :avatar, AvatarUploader

  def own?(post)
    self.id == post.user_id
  end

  def bookmark(post)
    bookmark_posts << post
  end
  
  def unbookmark(post)
    bookmark_posts.destroy(post)
  end
  
  def bookmark?(post)
    bookmark_posts.include?(post)
  end
end
