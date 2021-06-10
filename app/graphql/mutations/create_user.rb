module Mutations
  class CreateUser < BaseMutation
    argument :display_name, String, required: true
    argument :credentials, Types::AuthProviderCredentialsInput, required: true

    field :success, String, null: false
    field :user, Types::UserType, null: true
    field :errors, [String], null: false

    def resolve(display_name:, credentials:)
      user = User.new(
        display_name: display_name,
        email: credentials&.[](:email),
        password: credentials&.[](:password)
      )

      if user.save
        return { success: true, errors: [], user: user }
      end

      { success: false, errors: user.errors.full_messages, user: nil }
    end
  end
end
