module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :display_name, String, null: false
    field :email, String, null: false
    field :avatar, Types::AttachmentType, null: false
  end
end
