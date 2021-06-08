class Attachment < ApplicationRecord
  enum status: %w[inactive active]

  mount_uploader :file, FileUploader

  belongs_to :imageable, polymorphic: true, optional: true
end
