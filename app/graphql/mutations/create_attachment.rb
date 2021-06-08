module Mutations
  class CreateAttachment < BaseMutation
    # argument :file, File, required: true
    argument :remote_file_url, String, required: true

    field :success, String, null: false
    field :errors, [String], null: false

    def resolve(remote_file_url:)
      attachment = Attachment.new
      attachment.remote_file_url = remote_file_url

      if attachment.save
        return { success: true, errors: [] }
      end

      { success: false, errors: attachment.errors.full_messages }
    end
  end
end
