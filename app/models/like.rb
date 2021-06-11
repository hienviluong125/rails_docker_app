class Like < ApplicationRecord
  validates :post, uniqueness: { scope: :user }

  belongs_to :post
  belongs_to :user
end
