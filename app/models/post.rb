class Post < ApplicationRecord
  validates :content, presence: true
  validates :short_content, presence: true

  has_many :attachments, as: :imageable
end
