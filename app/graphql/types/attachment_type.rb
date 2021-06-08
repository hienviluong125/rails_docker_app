module Types
  class AttachmentType < Types::BaseObject
    field :id, ID, null: false
    field :attachment_type, String, null: false
    field :url, String, null: false

    def attachment_type
      object.file.content_type
    end

    def url
      host = ENV["HOST"] || "http://localhost:3000"
      file_url = object.file.url

      return (host + file_url) if Rails.env.development?

      file_url
    end
  end
end
