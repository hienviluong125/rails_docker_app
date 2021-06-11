class Comment < ApplicationRecord
  validates :content, presence: true

  belongs_to :user
  belongs_to :post

  before_save :generate_short_content

  private

  def generate_short_content
    self.short_content = content[0..55] if content.present?
  end
end
