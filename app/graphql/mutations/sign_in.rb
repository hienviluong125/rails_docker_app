module Mutations
  class SignIn < BaseMutation
    argument :credentials, Types::AuthProviderCredentialsInput, required: false

    field :token, String, null: true
    field :success, String, null: false
    field :errors, [String], null: false
    field :user, Types::UserType, null: true

    def resolve(credentials: nil)
      if credentials.blank?
        return { success: false, errors: ["Invalid credential"] }
      end

      user = User.find_by(email: credentials[:email])

      if user.blank?
        return { success: false, errors: ["Account doesn't exist"] }
      end

      if !user.authenticate(credentials[:password])
        return { success: false, errors: ["Invalid email or password"] }
      end

      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      token = crypt.encrypt_and_sign("user-id:#{ user.id }")

      { success: true, errors: [], user: user, token: token }
    end
  end
end
