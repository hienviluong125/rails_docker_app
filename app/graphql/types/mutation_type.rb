module Types
  class MutationType < Types::BaseObject
    field :destroy_post, mutation: Mutations::DestroyPost
    field :update_post, mutation: Mutations::UpdatePost
    field :create_post, mutation: Mutations::CreatePost
    field :create_attachment, mutation: Mutations::CreateAttachment
    field :create_user, mutation: Mutations::CreateUser
    field :sign_in, mutation: Mutations::SignIn
  end
end
