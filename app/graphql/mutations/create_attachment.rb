module Mutations
  class CreateAttachment < BaseMutation
    argument :file, ApolloUploadServer::Upload, required: false
    argument :remote_file_url, String, required: false

    field :success, String, null: false
    field :attachment, Types::AttachmentType, null: true
    field :errors, [String], null: false

    def resolve(file:, remote_file_url:)
      attachment = Attachment.new

      if file.present?
        attachment.file = file
      elsif remote_file_url.present?
        attachment.remote_file_url = remote_file_url
      end

      if attachment.save
        return { success: true, errors: [], attachment: attachment }
      end

      { success: false, errors: attachment.errors.full_messages, attachment: nil }
    end
  end
end
