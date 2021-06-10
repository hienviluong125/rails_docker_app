class User < ApplicationRecord
  has_secure_password

  validates :display_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_length_of :password, minimum: 6

  has_many :posts, dependent: :destroy
  has_one :avatar, as: :imageable, dependent: :destroy, class_name: "Attachment"
end
