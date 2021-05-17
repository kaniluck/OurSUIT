class Post < ApplicationRecord

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  has_many :post_comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def save_tags(savepost_tags)
    savepost_tags.each do |new_name|
    post_tag = Tag.find_or_create_by(name: new_name)
    self.tags << post_tag
    end
  end

  attachment :image

  validates :title, presence: true
  validates :image, presence: true

end
