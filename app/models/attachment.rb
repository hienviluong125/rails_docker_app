class Attachment < ApplicationRecord
  enum status: %w[inactive active]

  mount_uploader :file, FileUploader

  validates :file, presence: true

  belongs_to :imageable, polymorphic: true, optional: true
end
