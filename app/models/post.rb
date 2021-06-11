class Post < ApplicationRecord
  validates :content, presence: true

  has_many :attachments, as: :imageable, dependent: :destroy
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_by_users, through: :likes, source: :post
  has_many :comments, dependent: :destroy

  before_save :generate_short_content

  private

  def generate_short_content
    self.short_content = content[0..55] if content.present?
  end
end
