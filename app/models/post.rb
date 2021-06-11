class Post < ApplicationRecord
  validates :content, presence: true
  validates :short_content, presence: true

  has_many :attachments, as: :imageable, dependent: :destroy
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_by_users, through: :likes, source: :post
end
